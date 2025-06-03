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
        children: [
          const Text(
            'Contact',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          Center(
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
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
                                          color: Colors.blueGrey,
                                        ),
                                        SizedBox(width: 8),
                                        Text('chandubajaj095@gmail.com'),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.phone,
                                          color: Colors.blueGrey,
                                        ),
                                        SizedBox(width: 8),
                                        Text('+39 3272965743'),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.blueGrey,
                                        ),
                                        SizedBox(width: 8),
                                        Text('Rome, Italy'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 48),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.language,
                                          color: Colors.blueGrey,
                                        ),
                                        SizedBox(width: 8),
                                        Text('www.chandu0950.com'),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.link,
                                          color: Colors.blueGrey,
                                        ),
                                        SizedBox(width: 8),
                                        Flexible(
                                          child: Text(
                                            'LinkedIn: sarathchandrakumar-thottuchirayil',
                                            overflow: TextOverflow.ellipsis,
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
                                  Icon(Icons.email, color: Colors.blueGrey),
                                  SizedBox(width: 8),
                                  Text('chandubajaj095@gmail.com'),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: const [
                                  Icon(Icons.phone, color: Colors.blueGrey),
                                  SizedBox(width: 8),
                                  Text('+39 3272965743'),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.blueGrey,
                                  ),
                                  SizedBox(width: 8),
                                  Text('Rome, Italy'),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: const [
                                  Icon(Icons.language, color: Colors.blueGrey),
                                  SizedBox(width: 8),
                                  Text('www.chandu0950.com'),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: const [
                                  Icon(Icons.link, color: Colors.blueGrey),
                                  SizedBox(width: 8),
                                  Flexible(
                                    child: Text(
                                      'LinkedIn: sarathchandrakumar-thottuchirayil',
                                      overflow: TextOverflow.ellipsis,
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
