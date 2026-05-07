import 'package:flutter/material.dart';
import 'package:website/widgets/glass_text.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    const heroTextStyle = TextStyle(
      fontFamily: 'system-ui', // Matches the CSS
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(255, 255, 255, 0.7), // Semi-transparent white
      shadows: [
        // This creates the "glow"
        Shadow(
          blurRadius: 10.0,
          color: Color.fromRGBO(255, 255, 255, 0.5),
        ),
        Shadow(
          blurRadius: 20.0,
          color: Color.fromRGBO(255, 255, 255, 0.3),
        ),
      ],
    );
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80.0),
      child: Column(
        children: [
          GlassTextWeb('Aryan Pathak', fontSize: 64),
          const SizedBox(height: 16),
          GlassTextWeb(
            'Mobile Developer · Apple Swift Student Challenge Winner',
            fontSize: 24,
          ),
          const SizedBox(height: 12),
          const Text(
            'B.E. Information Technology · TSEC, Mumbai University · CGPA 8.3',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white54),
          ),
        ],
      ),
    );
  }
}