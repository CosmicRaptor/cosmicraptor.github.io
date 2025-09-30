import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import '../widgets/glass_app_bar.dart';
import '../widgets/sections/about_section.dart';
import '../widgets/sections/contact_section.dart';
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

  @override
  void initState() {
    super.initState();
    // Make sure your shader file is in assets/shaders/matrix.frag
    _programFuture = ui.FragmentProgram.fromAsset('shaders/matrix.frag');
    _stopwatch = Stopwatch()..start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const GlassAppBar(),
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
                const PortfolioContent(),
              ],
            ),
          );
        },
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
          child: const SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 64.0, horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeroSection(),
                SizedBox(height: 120),
                AboutSection(),
                SizedBox(height: 48),
                ProjectsSection(),
                SizedBox(height: 48),
                SkillsSection(),
                SizedBox(height: 48),
                ContactSection(),
              ],
            ),
          ),
        ),
      );
    });
  }
}