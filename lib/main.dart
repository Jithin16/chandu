import 'package:flutter/material.dart';
import 'pages/hero_section.dart';
import 'pages/about_section.dart';
import 'pages/contact_section.dart';
import 'pages/experience_section.dart' as exp;
import 'pages/publications_section.dart' as pub;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final aboutKey = GlobalKey();
  final experienceKey = GlobalKey();
  final publicationsKey = GlobalKey();
  final contactKey = GlobalKey();
  final scrollController = ScrollController();
  bool showGoToTop = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset > 200 && !showGoToTop) {
        setState(() => showGoToTop = true);
      } else if (scrollController.offset <= 200 && showGoToTop) {
        setState(() => showGoToTop = false);
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MediaQuery.of(context).size.width < 700
          ? _AppDrawer(
              onNavTap: (section) {
                Navigator.pop(context);
                switch (section) {
                  case 'About':
                    scrollToSection(aboutKey);
                    break;
                  case 'Experience':
                    scrollToSection(experienceKey);
                    break;
                  case 'Publications':
                    scrollToSection(publicationsKey);
                    break;
                  case 'Contact':
                    scrollToSection(contactKey);
                    break;
                }
              },
            )
          : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 700;
          return Stack(
            children: [
              SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    _NavBar(
                      isMobile: isMobile,
                      onNavTap: (section) {
                        switch (section) {
                          case 'About':
                            scrollToSection(aboutKey);
                            break;
                          case 'Experience':
                            scrollToSection(experienceKey);
                            break;
                          case 'Publications':
                            scrollToSection(publicationsKey);
                            break;
                          case 'Contact':
                            scrollToSection(contactKey);
                            break;
                        }
                      },
                    ),
                    HeroSection(isMobile: isMobile),
                    Container(
                      key: aboutKey,
                      child: AboutSection(isMobile: isMobile),
                    ),
                    Container(
                      key: experienceKey,
                      child: ExperienceSection(isMobile: isMobile),
                    ),
                    Container(
                      key: publicationsKey,
                      child: PublicationsSection(isMobile: isMobile),
                    ),
                    Container(
                      key: contactKey,
                      child: ContactSection(isMobile: isMobile),
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      '© 2025 Jithindash K. All rights reserved.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              if (showGoToTop)
                Positioned(
                  bottom: 32,
                  right: 32,
                  child: FloatingActionButton(
                    onPressed: scrollToTop,
                    child: const Icon(Icons.arrow_upward),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _NavBar extends StatelessWidget {
  final bool isMobile;
  final void Function(String section) onNavTap;
  const _NavBar({required this.isMobile, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 64,
        vertical: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Your Name',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          if (!isMobile)
            Row(
              children: [
                _NavButton('About', onTap: onNavTap),
                _NavButton('Experience', onTap: onNavTap),
                _NavButton('Publications', onTap: onNavTap),
                _NavButton('Contact', onTap: onNavTap),
              ],
            )
          else
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final void Function(String section) onTap;
  const _NavButton(this.label, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onTap(label),
      child: Text(label, style: const TextStyle(fontSize: 18)),
    );
  }
}

class _AppDrawer extends StatelessWidget {
  final void Function(String section) onNavTap;
  const _AppDrawer({required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueGrey),
            child: Text(
              'Navigation',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(title: const Text('About'), onTap: () => onNavTap('About')),
          ListTile(
            title: const Text('Experience'),
            onTap: () => onNavTap('Experience'),
          ),
          ListTile(
            title: const Text('Publications'),
            onTap: () => onNavTap('Publications'),
          ),
          ListTile(
            title: const Text('Contact'),
            onTap: () => onNavTap('Contact'),
          ),
        ],
      ),
    );
  }
}

// Standalone ExperienceSection widget
class ExperienceSection extends StatelessWidget {
  final bool isMobile;
  const ExperienceSection({required this.isMobile, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.withOpacity(0.05),
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
        ],
      ),
    );
  }
}

// Standalone PublicationsSection widget
class PublicationsSection extends StatelessWidget {
  final bool isMobile;
  const PublicationsSection({required this.isMobile, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.withOpacity(0.05),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 64,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Publications',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
