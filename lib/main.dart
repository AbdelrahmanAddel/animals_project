import 'package:animal_task/features/home/dependency_injection.dart';
import 'package:animal_task/features/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'features/onboarding/presentation/screen/onboarding_screen.dart';

void main() async {
  setupServiceLocator();
  runApp(AnimalApp());
}

class AnimalApp extends StatelessWidget {
  const AnimalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}
