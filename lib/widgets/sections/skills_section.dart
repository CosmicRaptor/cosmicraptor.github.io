import 'package:flutter/material.dart';

import '../glass_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      'Flutter', 'Dart', 'Kotlin', 'Java', 'Swift',
      'Firebase', 'REST APIs', 'Git', 'CI/CD', 'Github Actions', 'XCode Cloud',
      'ARCore', 'On-Device ML', 'Rust FFI', 'Cryptography',
    ];
    return SizedBox(
      width: double.infinity,
      child: GlassCard(
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
                  backgroundColor: Colors.green.withValues(alpha: 0.2),
                  side: BorderSide(color: Colors.green.withValues(alpha: 0.5)),
                )).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
