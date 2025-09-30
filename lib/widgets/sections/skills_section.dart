import 'package:flutter/material.dart';

import '../glass_card.dart';

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
