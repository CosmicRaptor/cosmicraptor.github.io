import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:go_router/go_router.dart';
import 'package:website/misc/page_state.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController _bannerController;
  late Animation _textAnimation;
  late Animation<Offset> _slidingAnimation;
  final String _text =
      "I'm passionate about making Linux accessible and fun for everyone. I'm a Flutter developer and DevOps enthusiast who thrives in collaborative environments. Whether you're building the next big app or just tinkering with Linux, I'm always down to chat, code, troubleshoot issues, and maybe even swap some photography tips along the way. Let's explore the world of tech and creativity together!";
  bool isFinishedTextAnimation = false;
  String buttonText = 'Destroy';
  double _opacity = 0;
  var github = GitHub(auth: findAuthenticationFromEnvironment());
  late Repository repo;
  late RepositoryCommit commit;
  bool hasLoadedGithubData = false;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    _bannerController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _textAnimation =
        Tween(begin: 0.0, end: _text.length.toDouble()).animate(controller);
    _slidingAnimation = Tween<Offset>(
      begin: const Offset(1, 1),
      end: const Offset(0, 0),
    ).animate(
        CurvedAnimation(parent: _bannerController, curve: Curves.easeInOut));
    controller.forward();
    _bannerController.forward();
    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        setState(() {
          isFinishedTextAnimation = true;
          _opacity = 1;
        });
      }
    });
    _loadRepositoryData();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    _bannerController.dispose();
    super.dispose();
  }

  Future<void> _loadRepositoryData() async {
    repo = await github.repositories
        .getRepository(RepositorySlug('CosmicRaptor', 'website'));

    commit = await github.repositories.getCommit(
      RepositorySlug('CosmicRaptor', 'website'),
      repo.defaultBranch,
    );
    setState(() {
      hasLoadedGithubData = true;
    });
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            color: Colors.grey,
            onPressed: () {
              //go router push to index
              PageState.previousPage = '';
              context.go('/index');
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Stack(
        children: [
          SlideTransition(
            position: _slidingAnimation,
            child: Transform.rotate(
              angle: 45 * 3.141592653589793 / 180,
              child: Container(
                //blue color with opacity 0.5
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromRGBO(0, 0, 255, 0.5),
                ),
                height: 1000,
                width: screenSize.width,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Hello, I'm Aryan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _textAnimation,
                      builder: (context, widget) {
                        return RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 30,
                              fontFamily: 'Jetbrains-Mono',
                            ),
                            text: _text.substring(
                                0, _textAnimation.value.toInt()),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AnimatedOpacity(
                      duration: const Duration(seconds: 2),
                      curve: Curves.linear,
                      opacity: _opacity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            if (isFinishedTextAnimation) {
                              if (buttonText == 'Destroy') {
                                setState(() {
                                  controller.duration =
                                      const Duration(seconds: 2);
                                  controller.reverse();
                                  _bannerController.reverse();
                                  buttonText = 'Rebuild';
                                });
                              } else {
                                setState(() {
                                  controller.duration =
                                      const Duration(seconds: 10);
                                  controller.forward();
                                  _bannerController.forward();
                                  buttonText = 'Destroy';
                                });
                              }
                            }
                          },
                          child: Text(buttonText)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
              ),
              width: screenSize.width,
              child: Text(
                hasLoadedGithubData
                    //how many days and hours ago was the last commit
                    ? 'Latest commit: ${commit.sha!.substring(0, 7)}, ${commit.commit!.author!.date!.difference(DateTime.now()).inDays.abs()} days ago'
                    : 'Loading...',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
