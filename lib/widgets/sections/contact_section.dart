import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../glass_card.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchURL(String url, {bool isMail = false}) async {
    final Uri uri = isMail ? Uri(scheme: 'mailto', path: url) : Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text('Get In Touch',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 16),
            const Text(
              "I'm currently seeking opportunities in mobile development. Feel free to reach out via email or connect with me on social media.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, height: 1.5),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.email),
                  tooltip: 'aupathak1234@gmail.com',
                  onPressed: () => _launchURL('aupathak1234@gmail.com', isMail: true),
                ),
                IconButton(
                  icon: const Icon(Icons.code),
                  tooltip: 'GitHub',
                  onPressed: () => _launchURL('https://github.com/CosmicRaptor/'),
                ),
                IconButton(
                  icon: const Icon(Icons.person),
                  tooltip: 'LinkedIn',
                  onPressed: () => _launchURL('https://www.linkedin.com/in/aryan-pathak-67a39b290/'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}