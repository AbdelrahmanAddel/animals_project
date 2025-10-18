import 'package:animal_task/features/main/presentation/screen/main_screen.dart';
import 'package:flutter/material.dart';

class AnimalApp extends StatelessWidget {
  const AnimalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
