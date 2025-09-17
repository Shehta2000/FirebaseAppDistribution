import 'package:flutter/material.dart';

class FirebaseAppDistribution extends StatelessWidget {
  const FirebaseAppDistribution({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase App Distribution'),
      ),
      body: Center(
        child: Text(
          'Welcome to Firebase App Distribution',
          style: TextStyle(
              color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
