import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  final bool isMobile;
  const SkillsSection({required this.isMobile, super.key});

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
          const Text(
            'Skills',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: const [
              SkillChip('Flutter'),
              SkillChip('Dart'),
              SkillChip('Firebase'),
              SkillChip('UI/UX Design'),
              SkillChip('REST APIs'),
              SkillChip('Git'),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;
  const SkillChip(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blue.shade50,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
