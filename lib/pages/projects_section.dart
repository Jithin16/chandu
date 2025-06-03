import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  final bool isMobile;
  const ExperienceSection({required this.isMobile, super.key});

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
            'Experience',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: const [
              ExperienceCard(
                title: 'PhD Research Scholar',
                org: 'EO_Lab – University of Tor-Vergata, Rome',
                period: '11-2023 – Present',
                details:
                    'National PhD researcher focused on integrating AI within Earth observation, including drone technology, onboard edge computing, AI in agriculture, and communication protocols. Developing AI algorithms for satellite imagery and remote sensing, enabling real-time processing and precision agriculture.',
              ),
              ExperienceCard(
                title: 'Research Scholar',
                org: 'ArcaLab-Sapienza School of Aerospace Engineering, Rome',
                period: '07-2019 – 10-2023',
                details:
                    'Designed and applied AI for spacecraft automation and remote sensing image processing. Embedded systems design and analysis for space robotics. Research Grant Winner for Project AISDA: Artificial Intelligence for Space Domain Awareness.',
              ),
              ExperienceCard(
                title: 'Embedded Software Engineer- Associate Tech Support',
                org: 'Accel Frontline Academy, Kerala',
                period: '03-2017 - 06-2018',
                details:
                    'Designed and debugged embedded system software, trained students in programming and embedded systems.',
              ),
              ExperienceCard(
                title: 'MEP-Supervisor',
                org: 'Monsoon Empress Associates, Kochi, India',
                period: '06-2016 - 02-2017',
                details:
                    'Supervised engineering teams, machinery servicing, HVAC systems, and BMS monitoring.',
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Text(
            'Publications',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  PublicationItem(
                    'S.T. Sasidharan et al., “An on-board AI-aided GNC for Safe Lunar Landing via Particle Swarm and GPU-optimized Convolutional Neural Networks”, IAF-conference, Sep 2022.',
                  ),
                  PublicationItem(
                    'F. Lattore et al., “A Moon Optical Navigation Robotic Facility on Simulated Terrain: MONSTER”, AAS-conference, Aug 2022.',
                  ),
                  PublicationItem(
                    'F. Lattore et al., “Transfer Learning for On-board Crater Detection using a Fully Convolutional Neural Network”, Elsevier-ICARUS-Journal.',
                  ),
                  PublicationItem(
                    'A. Carbone et al., “Hardware-in-the-loop simulations of future autonomous space systems aided by artificial intelligence”, PROCONF AII-Conference, Sep 2022.',
                  ),
                  PublicationItem(
                    'D. Spiller et al., “Wildfire segmentation analysis from edge computing for onboard real-time alerts using hyperspectral imagery”, IEEE MetroXRAINE Conference, Oct 2022.',
                  ),
                  PublicationItem(
                    'K. Thangavel et al., “On-board wildfire detection using Neural Networks: A Case study on Australian Bushfire”, MDPI Remote Sensing -Journal 2022.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String title;
  final String org;
  final String period;
  final String details;
  const ExperienceCard({
    required this.title,
    required this.org,
    required this.period,
    required this.details,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              org,
              style: const TextStyle(fontSize: 15, color: Colors.blueGrey),
            ),
            const SizedBox(height: 4),
            Text(
              period,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(details),
          ],
        ),
      ),
    );
  }
}

class PublicationItem extends StatelessWidget {
  final String text;
  const PublicationItem(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text('• $text'),
    );
  }
}
