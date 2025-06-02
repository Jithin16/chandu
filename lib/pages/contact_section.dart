import 'package:flutter/material.dart';

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
        children: const [
          Text(
            'Contact',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Feel free to reach out via email at your.email@example.com or connect with me on LinkedIn.',
          ),
        ],
      ),
    );
  }
}
