import 'package:flutter/material.dart';
import '../theme.dart';

class AboutSection extends StatelessWidget {
  final bool isMobile;
  const AboutSection({required this.isMobile, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 64,
        vertical: 40,
      ),
      child: Card(
        elevation: AppCardStyle.elevation,
        shape: AppCardStyle.shape,
        color: AppColors.card,
        shadowColor: AppColors.cardShadow,
        child: Padding(
          padding: AppCardStyle.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('About Me', style: AppTextStyles.sectionTitle),
                        SizedBox(height: 8),
                        Text(
                          'Inquisitive nature, always eager for new knowledge and advancing technologies. Pursuing work related to Artificial Intelligence and robotics. Fascinated by Space Exploration and the concepts of warp drive. Experienced and passionate in Embedded Systems, with strong programming and design skills on Windows and Linux. Experienced in multi-cultural environments.',
                          style: AppTextStyles.body,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
