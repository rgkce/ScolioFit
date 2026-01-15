import 'dart:io';
import 'package:flutter/material.dart';
import '../core/constants/app_strings.dart';
import '../services/disclaimer_service.dart';

class HealthDisclaimerScreen extends StatelessWidget {
  final bool initial;

  const HealthDisclaimerScreen({super.key, this.initial = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.get(context, 'health_disclaimer_title')),
        automaticallyImplyLeading: !initial,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.get(context, 'health_disclaimer_title'),
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      AppStrings.get(context, 'health_disclaimer_content'),
                      style: const TextStyle(fontSize: 16, height: 1.6),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child:
                  initial
                      ? Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => exit(0),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.red,
                                side: const BorderSide(color: Colors.red),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              child: Text(AppStrings.get(context, 'decline')),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                await DisclaimerService.accept();
                                if (context.mounted) {
                                  Navigator.of(
                                    context,
                                  ).pushReplacementNamed('/splash');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              child: Text(AppStrings.get(context, 'accept')),
                            ),
                          ),
                        ],
                      )
                      : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text(AppStrings.get(context, 'ok')),
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
