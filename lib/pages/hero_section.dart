import 'package:flutter/material.dart';
import '../theme.dart';

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
                  backgroundColor: AppColors.primary,
                  backgroundImage: AssetImage('assets/profile.jpeg'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Hi, I\'m Sarathchandrakumar T.S.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.sectionTitle,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Aerospace Engineer ',
                  style: AppTextStyles.cardSubtitle,
                ),
              ],
            )
          : Row(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundColor: AppColors.primary,
                  backgroundImage: AssetImage('assets/profile.jpeg'),
                ),
                const SizedBox(width: 48),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Hi, I\'m Sarathchandrakumar T.S.',
                      style: AppTextStyles.sectionTitle,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Aerospace Engineer',
                      style: AppTextStyles.cardSubtitle,
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
