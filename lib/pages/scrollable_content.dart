import 'package:flutter/material.dart';
import 'content.dart';

Widget buildScrollableContent() {
  return Column(
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
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        ),
        child: const Text('Events',
            style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
      const SizedBox(height: 40),
      Image.asset('assets/images/Hackorio_logo.png'),
      const SizedBox(height: 40),
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
  );
}
