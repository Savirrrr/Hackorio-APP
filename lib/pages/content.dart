import 'package:flutter/material.dart';

Widget buildCategoriesGrid() {
  return GridView.count(
    crossAxisCount: 2,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: [
      buildCategoryCard(
          'Blockchain',
          'Discover the technology behind Bitcoin and Ethereum',
          'assets/images/blockchain.png'),
      buildCategoryCard(
          'Web Development',
          'Web development is building web applications.',
          'assets/images/web_development.png'),
      buildCategoryCard(
          'Machine Learning',
          'Machine learning is a field of AI where computers learn from data to make decisions.',
          'assets/images/machine_learning.png'),
      buildCategoryCard(
          'Cyber security',
          'Cybersecurity is the practice of protecting systems, networks, and data from digital attacks.',
          'assets/images/cyber_security.png'),
      buildCategoryCard(
          'IOT',
          'The Internet of Thingsis a network of devices that communicate and exchange data.',
          'assets/images/iot.png'),
      buildCategoryCard(
          'Open Innovation',
          'Open innovation uses external ideas and collaborations to drive internal innovation.',
          'assets/images/open_innovation.png'),
    ],
  );
}

Widget buildCategoryCard(String title, String description, String imagePath) {
  return Card(
    color: Color.fromARGB(187, 96, 58, 211),
    margin: const EdgeInsets.all(10),
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 60,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
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
