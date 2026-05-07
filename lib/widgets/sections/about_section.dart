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
              "I'm a passionate Information Technology student at Thadomal Shahani Engineering College (Mumbai University), graduating in 2027. "
              "I specialize in building performant, user-centric mobile applications across iOS, Android, and the web. "
              "Winner of the Apple Swift Student Challenge 2026 and finalist at Smart India Hackathon 2025, "
              "I thrive on solving complex problems — from GPU-accelerated 3D rendering and AR-enhanced education to secure peer-to-peer payment systems.\n\n"
              "I currently lead a 15-member team (dev, design, DevOps) building and maintaining my college's official app, "
              "scaling adoption to 2000+ users (80% of students) with features like railway concession passes, attendance tracking, and notes uploading.",
              style: TextStyle(
                  fontSize: 16, color: Colors.white70, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}