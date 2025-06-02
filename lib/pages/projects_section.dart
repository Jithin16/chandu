import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  final bool isMobile;
  const ProjectsSection({required this.isMobile, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.withValues(alpha: 0.05),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 64,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Projects',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              ProjectCard(
                title: 'Project One',
                description:
                    'A brief description of your project. Highlight the tech stack and your role.',
                link: 'https://github.com/yourusername/project1',
              ),
              ProjectCard(
                title: 'Project Two',
                description:
                    'A brief description of your project. Highlight the tech stack and your role.',
                link: 'https://github.com/yourusername/project2',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String link;
  const ProjectCard({
    required this.title,
    required this.description,
    required this.link,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 12),
            TextButton(onPressed: () {}, child: const Text('View on GitHub')),
          ],
        ),
      ),
    );
  }
}
