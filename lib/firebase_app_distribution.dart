import 'package:firebase_app_distribution/feature/home.dart';
import 'package:flutter/material.dart';

class FirebaseAppDistribution extends StatelessWidget {
  const FirebaseAppDistribution({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
    );
  }
}
