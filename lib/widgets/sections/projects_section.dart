import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../glass_card.dart';

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
            const Text('Featured Projects',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 24),
            _ProjectEntry(
              title: 'ExoQuest 3D',
              subtitle: 'GPU-Accelerated Astronomical Visualization',
              description:
                  'Built an offline-first 3D space engine rendering 9,000 stars using Metal and custom shaders. '
                  'Implemented Keplerian orbital mechanics, habitable-zone modeling, and star spectral color mapping. '
                  'Designed hybrid Metal + RealityKit architecture with procedural planet generation, '
                  'and parallelized data processing using Swift actors. Winner project of Swift Student Challenge 2026.',
              technologies: const [
                'SwiftUI',
                'RealityKit',
                'Metal',
              ],
            ),
            const Divider(height: 48),
            _ProjectEntry(
              title: 'YugSmriti',
              subtitle: 'AR-Enhanced Historical Education',
              description:
                  'Sole mobile developer for a hackathon-winning project combining Flutter and ARCore to create interactive historical timelines, '
                  'AR tours, and rich multimedia content for immersive learning experiences. Won a regional hackathon with this project.',
              technologies: const [
                'Flutter',
                'Dart',
                'ARCore',
              ],
              sourceCodeUrl:
                  'https://github.com/CosmicRaptor/yugsmriti',
            ),
            const Divider(height: 48),
            _ProjectEntry(
              title: 'SheSafe',
              subtitle: "Women's Safety & Legal Assistant",
              description:
                  'Hackathon-finalist women safety app using Flutter and Java native modules. '
                  'Built an accessibility service that triggered panic events via triple volume-down press. '
                  'Integrated BLE distress beacons, dangerous-area warnings, and a RAG-based chatbot for POSH Act legal queries.',
              technologies: const [
                'Flutter',
                'Java',
                'Firebase',
                'BLE',
              ],
            ),
            const Divider(height: 48),
            _ProjectEntry(
              title: 'Kagi Kite Mobile App',
              subtitle: 'Open-Source News Reader',
              description:
                  'Developed an open-source news app featuring haptic feedback, caching with ETag, push notifications, '
                  'shimmer loading effects, Material UI components, and comprehensive test coverage.',
              technologies: const [
                'Flutter',
                'Dart',
                'REST API',
              ],
            ),
            const Divider(height: 48),
            _ProjectEntry(
              title: 'Interactive Portfolio Website',
              subtitle: 'This website!',
              description:
                  "My personal portfolio, built with Flutter Web to showcase my projects. "
                  "It features a dynamic 'Matrix' style background using a custom GLSL fragment shader for a real-time, interactive effect.",
              technologies: const [
                'Flutter Web',
                'GLSL Shaders',
                'dart:ui',
              ],
              sourceCodeUrl:
                  'https://github.com/CosmicRaptor/cosmicraptor.github.io',
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectEntry extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String description;
  final List<String> technologies;
  final String? liveDemoUrl;
  final String? sourceCodeUrl;

  const _ProjectEntry({
    required this.title,
    this.subtitle,
    required this.description,
    required this.technologies,
    this.liveDemoUrl,
    this.sourceCodeUrl,
  });

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            if (subtitle != null) ...[
              const SizedBox(width: 8),
              const Text('—',
                  style: TextStyle(color: Colors.white38)),
              const SizedBox(width: 8),
              Flexible(
                child: Text(subtitle!,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white54,
                        fontStyle: FontStyle.italic)),
              ),
            ],
          ],
        ),
        const SizedBox(height: 8),
        Text(description,
            style:
                const TextStyle(color: Colors.white70, height: 1.5)),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: technologies
              .map((tech) => Chip(
                    label: Text(tech),
                    backgroundColor:
                        Colors.green.withValues(alpha: 0.1),
                    side: BorderSide.none,
                  ))
              .toList(),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            if (liveDemoUrl != null)
              TextButton.icon(
                icon: const Icon(Icons.public),
                label: const Text('Live Demo'),
                onPressed: () => _launchURL(liveDemoUrl!),
              ),
            if (liveDemoUrl != null && sourceCodeUrl != null)
              const SizedBox(width: 8),
            if (sourceCodeUrl != null)
              TextButton.icon(
                icon: const Icon(Icons.code),
                label: const Text('Source Code'),
                onPressed: () => _launchURL(sourceCodeUrl!),
              ),
          ],
        )
      ],
    );
  }
}