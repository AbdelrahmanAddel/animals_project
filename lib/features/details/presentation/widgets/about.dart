import 'package:animal_task/core/theme/app_colors.dart';
import 'package:animal_task/core/theme/app_text_style.dart';
import 'package:animal_task/features/home/domain/entities/cat_entity.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key, required this.cat});
  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About', style: AppTextStyle.poppins600Medium22),
          SizedBox(height: 7),
          Text(
            cat.description,
            style: AppTextStyle.poppins400Regular14.copyWith(
              fontSize: 16,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
