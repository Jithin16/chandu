import 'package:flutter/material.dart';

class PublicationsSection extends StatelessWidget {
  final bool isMobile;
  const PublicationsSection({required this.isMobile, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.withOpacity(0.05),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 64,
        vertical: 48,
      ),
      child: Center(
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Publications',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                Column(
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
              ],
            ),
          ),
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
