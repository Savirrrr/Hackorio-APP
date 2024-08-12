import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double opacity;
  final Function(String) onMenuSelected;
  final Color backgroundColor;

  const CustomAppBar({
    Key? key,
    required this.opacity,
    required this.onMenuSelected,
    this.backgroundColor = const Color.fromARGB(255, 47, 90, 230),
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(
        child: Text(
          'HACKORIO.',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: opacity == 1.0
          ? Color.fromARGB(255, 37, 40, 82)
          : Color.fromARGB(255, 47, 90, 230),
      actions: <Widget>[
        PopupMenuButton<String>(
          color: const Color.fromARGB(255, 47, 90, 230),
          icon: const Icon(
            Icons.menu,
            color: Colors.white, // Set menu icon color to white
          ),
          onSelected: (value) {
            onMenuSelected(value);
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem<String>(
                value: 'Home',
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'About',
                child: Text(
                  'About',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Events',
                child: Text(
                  'Events',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Contact Us',
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ];
          },
        ),
      ],
    );
  }
}
