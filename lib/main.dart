import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/home_page.dart';
import 'package:flutter_application_2/game/game_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: const GamePage(),
    );
  }
} 