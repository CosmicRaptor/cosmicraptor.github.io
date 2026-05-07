import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import '../widgets/glass_app_bar.dart';
import '../widgets/sections/about_section.dart';
import '../widgets/sections/achievements_section.dart';
import '../widgets/sections/contact_section.dart';
import '../widgets/sections/experience_section.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/projects_section.dart';
import '../widgets/sections/skills_section.dart';
import '../widgets/shader_background.dart';


class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  late final Future<ui.FragmentProgram> _programFuture;
  late final Stopwatch _stopwatch;
  Offset _mousePosition = Offset.zero;

  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey achievementsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _programFuture = ui.FragmentProgram.fromAsset('shaders/matrix.frag');
    _stopwatch = Stopwatch()..start();
  }

  void _scrollTo(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: GlassAppBar(
        onAboutPressed: () => _scrollTo(aboutKey),
        onExperiencePressed: () => _scrollTo(experienceKey),
        onProjectsPressed: () => _scrollTo(projectsKey),
        onContactPressed: () => _scrollTo(contactKey),
      ),
      body: FutureBuilder<ui.FragmentProgram>(
        future: _programFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error loading shader: ${snapshot.error}'));
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
                PortfolioContent(
                  heroKey: heroKey,
                  aboutKey: aboutKey,
                  experienceKey: experienceKey,
                  projectsKey: projectsKey,
                  skillsKey: skillsKey,
                  achievementsKey: achievementsKey,
                  contactKey: contactKey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PortfolioContent extends StatelessWidget {
  final GlobalKey heroKey;
  final GlobalKey aboutKey;
  final GlobalKey experienceKey;
  final GlobalKey projectsKey;
  final GlobalKey skillsKey;
  final GlobalKey achievementsKey;
  final GlobalKey contactKey;

  const PortfolioContent({
    super.key,
    required this.heroKey,
    required this.aboutKey,
    required this.experienceKey,
    required this.projectsKey,
    required this.skillsKey,
    required this.achievementsKey,
    required this.contactKey,
  });

  @override
  Widget build(BuildContext context) {
    const double appBarHeight = kToolbarHeight;
    return LayoutBuilder(builder: (context, constraints) {
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeroSection(key: heroKey),

                // --- AboutSection ---
                const SizedBox(height: 120 - appBarHeight),
                Container(key: aboutKey, height: appBarHeight),
                const AboutSection(),

                // --- ExperienceSection ---
                const SizedBox(height: 0),
                Container(key: experienceKey, height: appBarHeight),
                const ExperienceSection(),

                // --- ProjectsSection ---
                const SizedBox(height: 0),
                Container(key: projectsKey, height: appBarHeight),
                const ProjectsSection(),

                // --- SkillsSection ---
                const SizedBox(height: 0),
                Container(key: skillsKey, height: appBarHeight),
                const SkillsSection(),

                // --- AchievementsSection ---
                const SizedBox(height: 0),
                Container(key: achievementsKey, height: appBarHeight),
                const AchievementsSection(),

                // --- ContactSection ---
                const SizedBox(height: 0),
                Container(key: contactKey, height: appBarHeight),
                const ContactSection(),
              ],
            ),
          ),
        ),
      );
    });
  }
}