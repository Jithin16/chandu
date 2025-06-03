import 'package:flutter/material.dart';
import 'pages/hero_section.dart';
import 'pages/about_section.dart';
import 'pages/contact_section.dart';
import 'pages/experience_section.dart' as exp;
import 'pages/publications_section.dart' as pub;
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chandu\'s Portfolio',
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primary,
          onPrimary: Colors.white,
          secondary: AppColors.secondary,
          onSecondary: Colors.white,

          surface: AppColors.card,
          onSurface: AppColors.textPrimary,
          error: Colors.red,
          onError: Colors.white,
        ),
        scaffoldBackgroundColor: AppColors.background,
        cardColor: AppColors.card,
        dividerColor: AppColors.divider,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headlineMedium: AppTextStyles.sectionTitle,
          titleMedium: AppTextStyles.cardTitle,
          bodyMedium: AppTextStyles.body,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.card,
          foregroundColor: AppColors.primary,
          elevation: 0,
          centerTitle: true,
        ),
        iconTheme: const IconThemeData(color: AppColors.icon),
        useMaterial3: true,
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
                      child: exp.ExperienceSection(isMobile: isMobile),
                    ),
                    Container(
                      key: publicationsKey,
                      child: pub.PublicationsSection(isMobile: isMobile),
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
            'Chandu',
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
