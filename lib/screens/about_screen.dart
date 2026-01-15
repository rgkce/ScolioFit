import 'package:flutter/material.dart';
import '../core/constants/app_strings.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.get(context, 'about_us'))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          children: [
            // App Logo
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/logo.png',
                width: 100,
                height: 100,
                errorBuilder:
                    (context, error, stackTrace) => Icon(
                      Icons.accessibility_new,
                      size: 100,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              AppStrings.get(context, 'app_name'),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${AppStrings.get(context, 'version')} 1.0.0',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 48),

            // Description Card
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text(
                      AppStrings.get(context, 'about_description'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, height: 1.6),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Mission Section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.get(context, 'our_mission'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              AppStrings.get(context, 'our_mission_desc'),
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 64),
            const Text(
              '© 2026 ScolioFit Team',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
