import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class GlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onProjectsPressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onContactPressed;

  const GlassAppBar({
    super.key,
    required this.onProjectsPressed,
    required this.onAboutPressed,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.white.withValues(alpha: 0.1),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Aryan Pathak', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(onPressed: onProjectsPressed, child: const Text('Projects')),
                    TextButton(onPressed: onAboutPressed, child: const Text('About')),
                    TextButton(onPressed: onContactPressed, child: const Text('Contact')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}