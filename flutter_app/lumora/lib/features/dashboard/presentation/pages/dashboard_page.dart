import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lumora'),
      ),
      body: const Center(
        child: Text(
          'Lumora\nSmart RGB Lighting Platform',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}