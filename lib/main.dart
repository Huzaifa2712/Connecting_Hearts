import 'package:flutter/material.dart';
import 'package:social_network_app/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Connecting-Hearts',
      theme: ThemeData(
        primaryColor: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.purple.shade800,
        ),
      ),
      home: const Home(),
    );
  }
}
