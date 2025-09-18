import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Firebase App Distribution'),
      ),
      body: Center(
        child: Text(
          'Welcome to Github Actions ',
          style: TextStyle(fontSize: 50, color: Colors.red),
        ),
      ),
    );
  }
}
