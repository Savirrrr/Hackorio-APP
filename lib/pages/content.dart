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
          'assets/images/Blockchain.png'),
      buildCategoryCard(
          'Web Development',
          'Web development is building web applications.',
          'assets/images/Web.png'),
      buildCategoryCard(
          'Machine Learning',
          'Machine learning is a field of AI where computers learn from data to make decisions.',
          'assets/images/ML.png'),
      buildCategoryCard(
          'Cyber security',
          'Cybersecurity is the practice of protecting networks from digital attacks.',
          'assets/images/cybersecurity.png'),
      buildCategoryCard(
          'IOT',
          'The Internet of Things is a network of devices that communicate and exchange data.',
          'assets/images/IOT.png'),
      buildCategoryCard(
          'Open Innovation',
          'Open innovation uses external ideas and collaborations to drive internal innovation.',
          'assets/images/Open_innovation.png'),
    ],
  );
}

Widget buildCategoryCard(String title, String description, String imagePath) {
  return Card(
    color: const Color.fromARGB(187, 96, 58, 211),
    margin: const EdgeInsets.all(10),
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Container(
      padding: const EdgeInsets.all(10),
      height: 500, // Increased height
      width: 150, // Increased width
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 30,
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
