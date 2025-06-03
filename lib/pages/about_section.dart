import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  final bool isMobile;
  const AboutSection({required this.isMobile, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blueGrey.withValues(alpha: 0.05),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 64,
        vertical: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'About Me',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'A short introduction about yourself, your background, and what you are passionate about. You can mention your education, experience, and what makes you unique as a developer.',
          ),
        ],
      ),
    );
  }
}
