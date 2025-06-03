import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  final bool isMobile;
  const AboutSection({required this.isMobile, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 64,
        vertical: 48,
      ),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.blueGrey.shade100,
                    child: Icon(Icons.person, size: 40, color: Colors.blueGrey),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'SARATHCHANDRAKUMAR T. (CHANDU)',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Aerospace Engineer',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blueGrey,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text('Rome, Italy'),
                        SizedBox(height: 4),
                        Text('chandubajaj095@gmail.com | +39 3272965743'),
                        SizedBox(height: 4),
                        Text('www.chandu0950.com'),
                        SizedBox(height: 4),
                        Text('LinkedIn: sarathchandrakumar-thottuchirayil'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'About Me',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Inquisitive nature, always eager for new knowledge and advancing technologies. Pursuing work related to Artificial Intelligence and robotics. Fascinated by Space Exploration and the concepts of warp drive. Experienced and passionate in Embedded Systems, with strong programming and design skills on Windows and Linux. Experienced in multi-cultural environments.',
              ),
              const SizedBox(height: 24),
              const Text(
                'Key Skills',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: const [
                  SkillChip('MS-OFFICE'),
                  SkillChip('AutoCAD'),
                  SkillChip('Solidworks'),
                  SkillChip('SolidEdge'),
                  SkillChip('Catia'),
                  SkillChip('Ansys'),
                  SkillChip('Vivado-Vitis'),
                  SkillChip('Altium Designer'),
                  SkillChip('Matlab'),
                  SkillChip('Simulink'),
                  SkillChip('Blender'),
                  SkillChip('Simscape'),
                  SkillChip('C/C++'),
                  SkillChip('Python'),
                  SkillChip('Embedded C'),
                  SkillChip('Verilog/VHDL'),
                  SkillChip('HTML'),
                  SkillChip('Microcontrollers'),
                  SkillChip('FPGA'),
                  SkillChip('System-On-Chips'),
                  SkillChip('Arduino'),
                  SkillChip('Raspberry-Pi'),
                  SkillChip('Jetson-GPUs'),
                  SkillChip('Movidius VPUs'),
                  SkillChip('Communications-Protocols'),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Languages',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Malayalam (Native), English (C1), Hindi (C1/A2/B2), Italian (A2/A1), Tamil (C1/A1)',
              ),
            ],
          ),
        ),
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
