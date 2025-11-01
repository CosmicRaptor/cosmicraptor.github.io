import 'package:flutter/material.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Aryan Pathak",
            textAlign: TextAlign.center,
            style: heroTextStyle.copyWith(fontSize: 72),
          ),
          SizedBox(height: 16),
          Text(
            "I build beautiful and performant cross-platform applications.",
            textAlign: TextAlign.center,
            style: heroTextStyle.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}