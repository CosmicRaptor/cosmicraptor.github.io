import 'package:flutter/material.dart';

import '../glass_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Experience',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 24),
            _ExperienceEntry(
              role: 'Mobile Developer Intern',
              company: 'Nomesma Technologies Pvt. Ltd.',
              location: 'Mumbai, India',
              duration: 'July 2025 – Sept 2025',
              bullets: const [
                'Built a cross-platform MVP for peer-to-peer payments in Flutter, focusing on secure transaction flows.',
                'Translated Figma wireframes into responsive UI and optimized rendering performance across Android and iOS.',
                'Integrated native Java/Swift modules, hardware keychains, and Rust cryptographic libraries.',
                'Diagnosed and resolved development and production issues using logs, crash analytics, and performance profiling; automated builds through GitHub Actions, Xcode Cloud, and TestFlight.',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ExperienceEntry extends StatelessWidget {
  final String role;
  final String company;
  final String location;
  final String duration;
  final List<String> bullets;

  const _ExperienceEntry({
    required this.role,
    required this.company,
    required this.location,
    required this.duration,
    required this.bullets,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(role,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                  const SizedBox(height: 4),
                  Text(company,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                          fontStyle: FontStyle.italic)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(duration,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white54)),
                const SizedBox(height: 4),
                Text(location,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white54)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...bullets.map((bullet) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ',
                      style: TextStyle(
                          color: Colors.greenAccent, fontSize: 16)),
                  Expanded(
                    child: Text(bullet,
                        style: const TextStyle(
                            color: Colors.white70, height: 1.5)),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
