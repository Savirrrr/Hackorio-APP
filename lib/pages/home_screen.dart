import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'content.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _appBarOpacity = 1.0;

  void _onMenuSelected(String value) {
    switch (value) {
      case 'Home':
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 'About':
        Navigator.pushReplacementNamed(context, '/about');
        break;
      case 'Events':
        Navigator.pushReplacementNamed(context, '/events');
        break;
      case 'Contact Us':
        Navigator.pushReplacementNamed(context, '/contact');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 40, 82),
      appBar: CustomAppBar(
        opacity: _appBarOpacity,
        onMenuSelected: _onMenuSelected,
        backgroundColor:
            const Color.fromARGB(255, 47, 90, 230), // Set the custom color here
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollUpdateNotification) {
            setState(() {
              _appBarOpacity =
                  (1.0 - notification.metrics.pixels / 200).clamp(0.0, 1.0);
            });
          }
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'Hackorio offers a wide range of opportunities for our members to get involved in hackathons, mentorship programs, events, etc., and to enhance their skills, expand their network, and be part of an exhilarating hackathon culture.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/events');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  'Events',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              Image.asset(
                'assets/images/Hackorio_logo.png',
                height: 250,
                width: 250,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              buildCategoriesGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
