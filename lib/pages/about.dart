import 'package:flutter/material.dart';
import 'app_bar.dart'; // Import the custom AppBar

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Achievements',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Our technical club has excelled in local, regional, and national hackathons, highlighting our members\' strong problem-solving abilities and coding expertise. Our workshops and coding boot camps are well-attended, receiving positive feedback and emphasizing our dedication to knowledge sharing. Additionally, our members have published research in respected journals and conferences, showcasing our commitment to technological innovation and community impact.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatCard(
                        'assets/images/zoom_logo.png', '10+', 'Events'),
                    _buildStatCard(
                        'assets/images/people_logo.png', '1000+', 'Students'),
                    _buildStatCard(
                        'assets/images/medal_logo.png', '26', 'Awards'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String imagePath, String number, String label) {
    return Card(
      color: Colors.deepPurpleAccent,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              height: 40,
              width: 40,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Text(
              number,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
