import 'package:flutter/material.dart';
import 'package:hackorio_app/pages/app_bar.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  double _appBarOpacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        opacity: _appBarOpacity,
        onMenuSelected: (value) {
          // Handle menu item selection
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
        },
      ),
      backgroundColor:
          const Color.fromARGB(255, 37, 40, 82), // Match home screen color
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              buildEventCard(
                imagePath: 'assets/images/unite.jpg',
                eventName: 'TECH HACK #3',
                description:
                    'TECH HACK #3 was a dynamic three-day event featuring a comprehensive bootcamp on day one followed by an exhilarating overnight hackathon across seven parallel domains. Participants engaged in intense collaboration, tackling cutting-edge challenges from AI to cybersecurity, showcasing their innovation and technical prowess.',
              ),
              buildEventCard(
                imagePath: 'assets/images/Uncease.png',
                eventName: 'UNCEASE',
                description:
                    'Two days of immersive workshops on web technologies followed by an action-packed hackathon. Empowering students to learn, create, and innovate in the fast-paced world of web development.',
              ),
              buildEventCard(
                imagePath: 'assets/images/unite.jpg',
                eventName: 'IDEATHON 2K23',
                description:
                    'Join our Ideathon where students brainstorm and pitch innovative ideas without prototypes, showcasing creativity and visionary thinking!',
              ),
              buildEventCard(
                imagePath: 'assets/images/Unite.png',
                eventName: 'HACKORIO UNITE',
                description:
                    'Hackorio Unite brought the thrill of hackathons to our college, inspiring students to dive into the world of innovation and collaboration. Join us as we unite to fuel creativity, push boundaries, and make impactful strides in the tech world.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEventCard({
    required String imagePath,
    required String eventName,
    required String description,
  }) {
    return Card(
      color: Colors.deepPurpleAccent,
      margin: const EdgeInsets.all(10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 400,
            width: double.infinity,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  eventName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add functionality for Learn More button
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    'Learn More',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
