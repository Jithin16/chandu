import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final bool isMobile;
  const HeroSection({required this.isMobile, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 64,
        vertical: 50,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 48,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Hi, I\'m Your Name',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Flutter Developer | UI/UX Enthusiast',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            )
          : Row(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                const SizedBox(width: 48),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Hi, I\'m Your Name',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Flutter Developer | UI/UX Enthusiast',
                      style: TextStyle(fontSize: 22, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
