import 'package:animal_task/features/details/presentation/widgets/details_body.dart';
import 'package:animal_task/features/home/domain/entities/cat_entity.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.cat});
  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DetailsBody(cat: cat),
    );
  }
}
