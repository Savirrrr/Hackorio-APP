import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackorio_app/pages/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  double _appBarOpacity = 1.0;
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _message = TextEditingController();

  Future<void> _emaill() async {
    print("Function clicked");
    String firstname = _firstname.text;
    String lastname = _lastname.text;
    String email = _email.text;
    String message = _message.text;

    final response = await http.post(
      Uri.parse("http://172.20.10.2:3000/sendmail"),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'message': message,
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email sent successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Failed to send email. Please try again.')),
      );
    }
  }

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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                // Contact Card
                Card(
                  color: const Color.fromARGB(255, 82, 90, 144),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/contact.jpg', // Add the contact image path
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Contact Us',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'A diverse community passionate about hackathons and technology. Join us to collaborate, innovate, and make a real-world impact through hands-on projects and hackathons.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          children: <Widget>[
                            Icon(Icons.email, color: Colors.white70),
                            SizedBox(width: 10),
                            Text(
                              'anurag.hackorio@anurag.edu.in',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: <Widget>[
                            Icon(Icons.location_on, color: Colors.white70),
                            SizedBox(width: 10),
                            Text(
                              'Hyderabad, Telangana',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.instagram,
                                  color: Colors.white, size: 20),
                              onPressed: () => launchUrl(Uri.parse(
                                  "https://www.instagram.com/anurag.hackorio")),
                            ),
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.twitter,
                                  color: Colors.white, size: 20),
                              onPressed: () => launchUrl(Uri.parse(
                                  "https://twitter.com/yourprofile")), // Update with correct URL
                            ),
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.linkedin,
                                  color: Colors.white, size: 20),
                              onPressed: () => launchUrl(Uri.parse(
                                  "https://www.linkedin.com/in/yourprofile")), // Update with correct URL
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Contact Form
                Card(
                  color: const Color.fromARGB(255, 82, 90, 144),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                controller: _firstname,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[800],
                                  hintText: 'First Name',
                                  hintStyle:
                                      const TextStyle(color: Colors.white70),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: _lastname,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[800],
                                  hintText: 'Last Name',
                                  hintStyle:
                                      const TextStyle(color: Colors.white70),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _email,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[800],
                            hintText: 'Your Email Address',
                            hintStyle: const TextStyle(color: Colors.white70),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          maxLines: 4,
                          controller: _message,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[800],
                            hintText: 'Message',
                            hintStyle: const TextStyle(color: Colors.white70),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: _emaill,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                            ),
                            child: const Text(
                              'Send Message',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
