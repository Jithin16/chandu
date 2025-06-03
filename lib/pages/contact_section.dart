import 'package:flutter/material.dart';
import '../theme.dart';

class ContactSection extends StatelessWidget {
  final bool isMobile;
  const ContactSection({required this.isMobile, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 64,
        vertical: 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Contact', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 32),
          Center(
            child: Card(
              elevation: AppCardStyle.elevation,
              shape: AppCardStyle.shape,
              color: AppColors.card,
              shadowColor: AppColors.cardShadow,
              child: Padding(
                padding: AppCardStyle.padding,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    bool isWide = constraints.maxWidth > 500;
                    return isWide
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.email,
                                          color: AppColors.icon,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'chandubajaj095@gmail.com',
                                          style: AppTextStyles.contact,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.phone,
                                          color: AppColors.icon,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          '+39 3272965743',
                                          style: AppTextStyles.contact,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.location_on,
                                          color: AppColors.icon,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'Rome, Italy',
                                          style: AppTextStyles.contact,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 48),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.language,
                                          color: AppColors.icon,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'www.chandu0950.com',
                                          style: AppTextStyles.contact,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: const [
                                        Icon(Icons.link, color: AppColors.icon),
                                        SizedBox(width: 8),
                                        Flexible(
                                          child: Text(
                                            'LinkedIn: sarathchandrakumar-thottuchirayil',
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTextStyles.contact,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.email, color: AppColors.icon),
                                  SizedBox(width: 8),
                                  Text(
                                    'chandubajaj095@gmail.com',
                                    style: AppTextStyles.contact,
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: const [
                                  Icon(Icons.phone, color: AppColors.icon),
                                  SizedBox(width: 8),
                                  Text(
                                    '+39 3272965743',
                                    style: AppTextStyles.contact,
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.location_on,
                                    color: AppColors.icon,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Rome, Italy',
                                    style: AppTextStyles.contact,
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: const [
                                  Icon(Icons.language, color: AppColors.icon),
                                  SizedBox(width: 8),
                                  Text(
                                    'www.chandu0950.com',
                                    style: AppTextStyles.contact,
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: const [
                                  Icon(Icons.link, color: AppColors.icon),
                                  SizedBox(width: 8),
                                  Flexible(
                                    child: Text(
                                      'LinkedIn: sarathchandrakumar-thottuchirayil',
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.contact,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
