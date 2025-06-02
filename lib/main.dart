import 'package:flutter/material.dart';
import 'pages/hero_section.dart';
import 'pages/about_section.dart';
import 'pages/skills_section.dart';
import 'pages/projects_section.dart';
import 'pages/contact_section.dart';

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
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
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
                  case 'Skills':
                    scrollToSection(skillsKey);
                    break;
                  case 'Projects':
                    scrollToSection(projectsKey);
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
                          case 'Skills':
                            scrollToSection(skillsKey);
                            break;
                          case 'Projects':
                            scrollToSection(projectsKey);
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
                      key: skillsKey,
                      child: SkillsSection(isMobile: isMobile),
                    ),
                    Container(
                      key: projectsKey,
                      child: ProjectsSection(isMobile: isMobile),
                    ),
                    Container(
                      key: contactKey,
                      child: ContactSection(isMobile: isMobile),
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      '© 2025 Your Name',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              if (showGoToTop)
                Positioned(
                  bottom: 24,
                  right: 24,
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
                _NavButton('Skills', onTap: onNavTap),
                _NavButton('Projects', onTap: onNavTap),
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
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(title: const Text('About'), onTap: () => onNavTap('About')),
          ListTile(
            title: const Text('Skills'),
            onTap: () => onNavTap('Skills'),
          ),
          ListTile(
            title: const Text('Projects'),
            onTap: () => onNavTap('Projects'),
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
