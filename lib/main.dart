import 'package:flutter/material.dart';
import 'features/onboarding/presentation/screen/onboarding_screen.dart';

void main() {
  runApp(AnimalApp());
}

class AnimalApp extends StatelessWidget {
  const AnimalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: OnboardingScreen());
  }
}
