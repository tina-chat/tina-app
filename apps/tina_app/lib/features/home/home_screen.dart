import 'package:flutter/material.dart';
import 'package:tina_app/router/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Home Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('Welcome to Tina AI Assistant'),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => SettingsRoute().go(context),
              child: const Text('Go to Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
