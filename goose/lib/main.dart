import 'package:flutter/material.dart';
import 'package:goose/level1.dart';
import 'level1.dart';

void main() {
  runApp(MyGameApp());
}

class MyGameApp extends StatelessWidget {
  const MyGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Game'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the first level screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Level1Screen()),
            );
          },
          child: Text('Start Game'),
        ),
      ),
    );
  }
}

class FirstLevelScreen extends StatelessWidget {
  const FirstLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 1'),
      ),
      body: Center(
        child: Text('Welcome to Level 1!'),
      ),
    );
  }
}
