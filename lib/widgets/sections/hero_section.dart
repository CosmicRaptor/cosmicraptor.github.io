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
          // Text(
          //   'Aryan Pathak',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     fontSize: 64,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.white,
          //     shadows: [Shadow(blurRadius: 10, color: Colors.green.withOpacity(0.5))],
          //   ),
          // ),
          GlassTextWeb('Aryan Pathak', fontSize: 64),
          const SizedBox(height: 16),
          // const Text(
          //   'I build beautiful and performant cross-platform applications.',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(fontSize: 26, color: Colors.white70),
          // ),
          GlassTextWeb(
            'I build beautiful and performant cross-platform applications.',
            fontSize: 26,
          ),
        ],
      ),
    );
  }
}