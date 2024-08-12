import 'package:flutter/material.dart';
import 'package:hackorio_app/pages/home_screen.dart';
import 'package:hackorio_app/pages/about.dart';
import 'package:hackorio_app/pages/events.dart';
import 'package:hackorio_app/pages/contact.dart';
// import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hackorio',
      // theme: ThemeData(
      //   primarySwatch: Colors.deepPurple,
      // ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        '/about': (context) => const AboutPage(),
        '/events': (context) => EventsPage(),
        '/contact': (context) => ContactPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
