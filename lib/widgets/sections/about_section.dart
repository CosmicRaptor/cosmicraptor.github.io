import 'package:flutter/material.dart';

import '../glass_card.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlassCard(
      child: Padding(
        padding: EdgeInsets.fromLTRB(40, 30, 40, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('About Me',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(height: 16),
            Text(
              "I'm a passionate Information Technology student from Mumbai with a deep interest in creating performant and user-centric mobile applications. I thrive on solving complex problems, from building secure communication platforms to exploring the intersection of mobile tech with AR and on-device machine learning.",
              style: TextStyle(
                  fontSize: 16, color: Colors.white70, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}