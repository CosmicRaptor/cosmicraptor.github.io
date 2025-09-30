import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80.0),
      child: Column(
        children: [
          Text(
            'Aryan Pathak',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [Shadow(blurRadius: 10, color: Colors.green.withOpacity(0.5))],
            ),
          ),
          const SizedBox(height: 16),
          // TODO: Replace with better tagline
          const Text(
            'I build beautiful and performant cross-platform applications.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}