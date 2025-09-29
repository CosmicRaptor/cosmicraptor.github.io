import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
// For the contact section links
// import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const ShaderApp());
}

class ShaderApp extends StatefulWidget {
  const ShaderApp({super.key});

  @override
  State<ShaderApp> createState() => _ShaderAppState();
}

class _ShaderAppState extends State<ShaderApp> {
  late final Future<ui.FragmentProgram> _programFuture;
  late final Stopwatch _stopwatch;
  Offset _mousePosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    _programFuture = ui.FragmentProgram.fromAsset('shaders/matrix.frag');
    _stopwatch = Stopwatch()..start();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const GlassAppBar(),
        body: FutureBuilder<ui.FragmentProgram>(
          future: _programFuture,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return MouseRegion(
              onHover: (event) => setState(() {
                _mousePosition = event.localPosition;
              }),
              child: Stack(
                children: [
                  ShaderBackground(
                    program: snapshot.data!,
                    stopwatch: _stopwatch,
                    mousePosition: _mousePosition,
                  ),
                  const PortfolioContent(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class PortfolioContent extends StatelessWidget {
  const PortfolioContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HeroSection(),
                const SizedBox(height: 120), // Space between Hero and first card
                // TODO: Replace with actual about me content
                const GlassCard(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('About Me', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                        SizedBox(height: 16),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                          style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                const ProjectsSection(),
                const SizedBox(height: 48),
                const SkillsSection(),
                const SizedBox(height: 48),
                const ContactSection(),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80.0),
      child: Column(
        children: [
          Text(
            'Aryan Pathak',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [Shadow(blurRadius: 10, color: Colors.green.withOpacity(0.5))],
            ),
          ),
          const SizedBox(height: 16),
          // TODO: Replace with better tagline
          const Text(
            'I build beautiful and performant cross-platform applications.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Featured Projects', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 24),
            // TODO: Replace with better projects
            _ProjectEntry(
              title: 'Secure Chat Application',
              description: 'A peer-to-peer, serverless chat app built for a hackathon, focusing on privacy and modern communication protocols.',
              technologies: const ['Flutter', 'Wi-Fi Aware', 'Mesh Networking'],
            ),
            const Divider(height: 48),
            _ProjectEntry(
              title: 'Personal City Concierge',
              description: 'A real-time city guidance app using agentic AI to provide a personalized experience for tourists and locals.',
              technologies: const ['Flutter', 'Geospatial ML', 'TensorFlow'],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectEntry extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;

  const _ProjectEntry({
    required this.title,
    required this.description,
    required this.technologies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white)),
        const SizedBox(height: 8),
        Text(description, style: const TextStyle(color: Colors.white70, height: 1.5)),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: technologies.map((tech) => Chip(label: Text(tech))).toList(),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            TextButton.icon(icon: const Icon(Icons.public), label: const Text('Live Demo'), onPressed: () {}),
            const SizedBox(width: 8),
            TextButton.icon(icon: const Icon(Icons.code), label: const Text('Source Code'), onPressed: () {}),
          ],
        )
      ],
    );
  }
}


class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual skills
    final skills = [
      'Flutter', 'Dart', 'Kotlin', 'Java', 'Swift',
      'Machine Learning', 'TensorFlow', 'ONNX', 'Geospatial Data',
      'Firebase', 'REST APIs', 'Git', 'CI/CD', 'UI/UX Design'
    ];
    return GlassCard(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Technologies & Skills', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 24),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: skills.map((skill) => Chip(
                label: Text(skill, style: const TextStyle(fontWeight: FontWeight.w500)),
                backgroundColor: Colors.green.withOpacity(0.2),
                side: BorderSide(color: Colors.green.withOpacity(0.5)),
              )).toList(),
            )
          ],
        ),
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text('Get In Touch', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 16),
            const Text(
              "I'm currently open to new opportunities. Feel free to reach out via email or connect with me on social media.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, height: 1.5),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: const Icon(Icons.email), tooltip: 'Email', onPressed: () {}),
                IconButton(icon: const Icon(Icons.code), tooltip: 'GitHub', onPressed: () {}),
                IconButton(icon: const Icon(Icons.person), tooltip: 'LinkedIn', onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class GlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlassAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.white.withOpacity(0.1),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Aryan Pathak', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(onPressed: () {}, child: const Text('Projects')),
                    TextButton(onPressed: () {}, child: const Text('About')),
                    TextButton(onPressed: () {}, child: const Text('Contact')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class GlassCard extends StatelessWidget {
  final Widget child;
  const GlassCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              width: 1.5,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class ShaderBackground extends StatelessWidget {
  const ShaderBackground({
    super.key,
    required this.program,
    required this.stopwatch,
    required this.mousePosition,
  });

  final ui.FragmentProgram program;
  final Stopwatch stopwatch;
  final Offset mousePosition;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ShaderPainter(program, stopwatch, mousePosition),
      size: Size.infinite,
    );
  }
}

class ShaderPainter extends CustomPainter {
  final ui.FragmentProgram program;
  final Stopwatch stopwatch;
  final Offset mousePosition;

  ShaderPainter(this.program, this.stopwatch, this.mousePosition) : super(repaint: _Ticker());

  @override
  void paint(Canvas canvas, Size size) {
    final shader = program.fragmentShader();
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, 1.0);
    shader.setFloat(3, stopwatch.elapsedMilliseconds / 1000.0);
    shader.setFloat(4, mousePosition.dx);
    shader.setFloat(5, size.height - mousePosition.dy);
    shader.setFloat(6, 0.0);
    shader.setFloat(7, 0.0);
    final paint = Paint()..shader = shader;
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant ShaderPainter oldDelegate) {
    return oldDelegate.mousePosition != mousePosition;
  }
}

class _Ticker extends ChangeNotifier {
  _Ticker() {
    Timer.periodic(const Duration(milliseconds: 16), (_) => notifyListeners());
  }
}