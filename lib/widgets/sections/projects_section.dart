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
              title: 'SafeYatri (SIH 2025)',
              description:
              'A tourist safety prototype with AR navigation, BLE mesh networking for offline location sharing, and on-device ML for real-time route safety prediction. Cleared internal Smart India Hackathon.',
              technologies: const ['Flutter', 'ARCore', 'BLE Mesh', 'ONNX'],
            ),
            const Divider(height: 48),
            _ProjectEntry(
              title: 'Peer-to-Peer Payments MVP',
              description:
              'As an intern, I developed a cross-platform MVP for secure P2P payments, integrating native Java/Swift modules and high-performance Rust libraries for cryptography via FFI.',
              technologies: const ['Flutter', 'Native Integration', 'Rust FFI', 'Cryptography', 'Github Actions', 'XCode Cloud'],
            ),
            const Divider(height: 48),
            _ProjectEntry(
              title: 'YugSmriti',
              description: 'Sole mobile developer for a hackathon-winning project combining Flutter and ARCore to create interactive historical timelines, AR tours, and rich multimedia content for immersive learning experiences. Won a regional hackathon with this project.',
              technologies: const ['Flutter', 'ARCore', 'Firebase'],
              sourceCodeUrl: 'https://github.com/CosmicRaptor/yugsmriti',
            ),
            const Divider(height: 48),
            _ProjectEntry(
              title: 'SheSafe',
              description: 'Hackathon-finalist women safety app using Flutter and Java native modules. Built an accessibility service that triggered panic events via triple volume-down press. Integrated BLE distress beacons, dangerous-area warnings, and a RAG-based chatbot for POSH Act legal queries.',
              technologies: const ['Flutter', 'Java', 'BLE', 'Firebase'],
            ),
            const Divider(height: 48),
            _ProjectEntry(
              title: 'Interactive Portfolio Website',
              description:
              "My personal portfolio, built with Flutter Web to showcase my projects. It features a dynamic 'Matrix' style background using a custom GLSL fragment shader for a real-time, interactive effect.",
              technologies: const ['Flutter Web', 'GLSL Shaders', 'dart:ui'],
              sourceCodeUrl: 'https://github.com/CosmicRaptor/cosmicraptor.github.io', // Example URL
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
  final String? liveDemoUrl;
  final String? sourceCodeUrl;

  const _ProjectEntry({
    required this.title,
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
        Text(title,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white)),
        const SizedBox(height: 8),
        Text(description,
            style: const TextStyle(color: Colors.white70, height: 1.5)),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: technologies
              .map((tech) => Chip(
            label: Text(tech),
            backgroundColor: Colors.green.withValues(alpha: 0.1),
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