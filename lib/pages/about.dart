import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_bar.dart';

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
                // Achievements Section
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
                // Statistics Cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatCard('assets/images/events.png', '10+', 'Events'),
                    _buildStatCard(
                        'assets/images/member.png', '1000+', 'Students'),
                    _buildStatCard('assets/images/medal.png', '26', 'Awards'),
                  ],
                ),
                const SizedBox(height: 30),
                // Meet Our Team Section
                const Center(
                  child: Text(
                    'Meet Our Team',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildTeamCards(),
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

  Widget _buildTeamCards() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTeamCard(
                'assets/images/mentor.jpg',
                'Dr.B.Ravinder Reddy',
                'Club Incharge',
                'https://www.instagram.com/poojitha_reddy6?igsh=MXNiaXdzZ2I1aWtiag%3D%3D',
                'https://x.com/home',
                'https://www.linkedin.com/in/poojitha-mukku-139979248/'),
            _buildTeamCard(
                'assets/images/member-1.jpg',
                'Mukku Poojitha',
                'President',
                'https://www.instagram.com/poojitha_reddy6?igsh=MXNiaXdzZ2I1aWtiag%3D%3D',
                'https://x.com/home',
                'https://www.linkedin.com/in/poojitha-mukku-139979248/'),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTeamCard(
                'assets/images/member-2.jpg',
                'Rao Shraunak',
                'Vice President',
                'https://www.instagram.com/',
                'https://twitter.com/home',
                'https://www.linkedin.com/in/rao-shraunak-reddy-452a9225a/'),
            _buildTeamCard(
                'assets/images/member-3.jpg',
                'Sharanya Reddy',
                'Secretary',
                'https://www.instagram.com/poojitha_reddy6?igsh=MXNiaXdzZ2I1aWtiag%3D%3D',
                'https://twitter.com/home',
                'https://www.linkedin.com/in/ravula-sharanya-reddy-19ab2a268/'),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTeamCard(
                'assets/images/member-4.jpg',
                'Tota Akshitha',
                'Vice President PR',
                'https://www.instagram.com/akshitha_reddii?igsh=a2kyZHY3bXNzbnk2',
                'https://x.com/home',
                'https://www.linkedin.com/in/thota-akshitha-03bb84242/'),
            _buildTeamCard(
                'assets/images/member-5.jpg',
                'Lalith Sangeeth',
                'App Developer',
                'https://www.instagram.com/mr_lalith_07__?igsh=MTJmb28weXlscWdxcQ%3D%3D',
                'https://x.com/home',
                'https://www.linkedin.com/in/lalith-sangeeth-jukanti-845857275/'),
          ],
        ),
      ],
    );
  }

  Widget _buildTeamCard(String imagePath, String name, String designation,
      String instagramUrl, String twitterUrl, String linkedinUrl) {
    return Card(
      color: Colors.deepPurpleAccent,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 170, // Increased width
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 150, // Increased height for the image
              width: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              designation,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            const Divider(color: Colors.white, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.instagram,
                      color: Colors.white, size: 20),
                  onPressed: () => _launchURL(instagramUrl),
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.twitter,
                      color: Colors.white, size: 20),
                  onPressed: () => _launchURL(twitterUrl),
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.linkedin,
                      color: Colors.white, size: 20),
                  onPressed: () => _launchURL(linkedinUrl),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,
          mode: LaunchMode
              .externalApplication); // Use LaunchMode.externalApplication to open in a browser
    } else {
      throw 'Could not launch $url';
    }
  }
}
