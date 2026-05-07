import 'package:flutter/material.dart';

import '../glass_card.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final achievements = [
      _AchievementItem(
        icon: Icons.emoji_events,
        iconColor: Colors.amberAccent,
        text: 'Winner of Apple Swift Student Challenge 2026',
      ),
      _AchievementItem(
        icon: Icons.star,
        iconColor: Colors.orangeAccent,
        text:
            'Finalist in Smart India Hackathon 2025, sole mobile developer in the team',
      ),
      _AchievementItem(
        icon: Icons.military_tech,
        iconColor: Colors.greenAccent,
        text: 'Won two regional hackathons as a sole Mobile developer',
      ),
      _AchievementItem(
        icon: Icons.groups,
        iconColor: Colors.cyanAccent,
        text:
            "Leading a 15-member team (dev, design, DevOps) to build and maintain college's official app (Play Store, App Store). "
            "Scaled adoption to 2000+ users (80% of students) with features like railway concession passes, attendance tracking, and notes uploading",
      ),
    ];

    return SizedBox(
      width: double.infinity,
      child: GlassCard(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Achievements & Leadership',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 24),
              ...achievements.map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(item.icon,
                            color: item.iconColor, size: 24),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(item.text,
                              style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  height: 1.5)),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class _AchievementItem {
  final IconData icon;
  final Color iconColor;
  final String text;

  const _AchievementItem({
    required this.icon,
    required this.iconColor,
    required this.text,
  });
}
