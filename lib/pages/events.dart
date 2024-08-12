import 'package:flutter/material.dart';
import 'app_bar.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  double _appBArOpacity = 1.0;

  void _onMenuSelected(String value) {
    switch (value) {
      case 'Home':
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 'About':
        Navigator.pushReplacementNamed(context, "/about");
        break;
      case 'Events':
        Navigator.pushReplacementNamed(context, "/events");
        break;
      case 'Contact Us':
        Navigator.pushReplacementNamed(context, "/contact");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 40, 82),
      appBar: CustomAppBar(
        opacity: _appBArOpacity,
        onMenuSelected: _onMenuSelected,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollUpdateNotification) {
            setState(() {
              _appBArOpacity =
                  (1.0 - notification.metrics.pixels / 200).clamp(0.0, 1.0);
            });
          }
          return true;
        },
        child: SingleChildScrollView(),
      ),
    );
  }
}
