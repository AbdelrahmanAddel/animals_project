import 'package:animal_task/animal_app.dart';
import 'package:animal_task/features/home/dependency_injection.dart';
import 'package:flutter/material.dart';

void main() async {
  setupServiceLocator();
  runApp(AnimalApp());
}
