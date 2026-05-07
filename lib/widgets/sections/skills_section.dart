import 'package:flutter/material.dart';

import '../glass_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = [
      'Dart',
      'Kotlin',
      'Swift',
      'Python',
      'Java',
    ];
    final tools = [
      'Git',
      'GitHub',
      'CI/CD',
      'GitHub Actions',
      'XCode Cloud',
      'Firebase',
      'TestFlight',
    ];
    return SizedBox(
      width: double.infinity,
      child: GlassCard(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Technologies & Skills',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 24),
              const Text('Languages',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white70)),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: languages
                    .map((skill) => Chip(
                          label: Text(skill,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500)),
                          backgroundColor:
                              Colors.green.withValues(alpha: 0.2),
                          side: BorderSide(
                              color:
                                  Colors.green.withValues(alpha: 0.5)),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 24),
              const Text('Tools',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white70)),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: tools
                    .map((skill) => Chip(
                          label: Text(skill,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500)),
                          backgroundColor:
                              Colors.blue.withValues(alpha: 0.15),
                          side: BorderSide(
                              color:
                                  Colors.blue.withValues(alpha: 0.4)),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
