import 'package:animal_task/core/common/custom_app_button.dart';
import 'package:animal_task/features/details/presentation/widgets/about.dart';
import 'package:animal_task/features/details/presentation/widgets/animal_description.dart';
import 'package:animal_task/features/details/presentation/widgets/animal_details.dart';
import 'package:animal_task/features/details/presentation/widgets/animal_image.dart';
import 'package:animal_task/features/home/domain/entities/cat_entity.dart';
import 'package:flutter/material.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key, required this.cat});
  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AnimalImage(cat: cat),
          SizedBox(height: 10),
          AnimalDetails(cat: cat),
          SizedBox(height: 20),
          AnimalDescription(cat: cat),
          SizedBox(height: 21),
          About(cat: cat),
          SizedBox(height: 21),
          CustomAppButton(
            child: Text(
              'Adopt me',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
