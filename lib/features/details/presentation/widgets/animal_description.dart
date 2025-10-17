import 'package:animal_task/core/theme/app_colors.dart';
import 'package:animal_task/core/theme/app_text_style.dart';
import 'package:animal_task/features/home/domain/entities/cat_entity.dart';
import 'package:flutter/material.dart';

class AnimalDescription extends StatelessWidget {
  const AnimalDescription({super.key, required this.cat});
  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildAnimalDescriptionItem(description: 'Male', title: 'Gender'),
          SizedBox(width: 21),
          _buildAnimalDescriptionItem(
            description: cat.lifeSpan,
            title: 'Life Span',
          ),
          SizedBox(width: 21),
          _buildAnimalDescriptionItem(description: cat.weight, title: 'Weight'),
        ],
      ),
    );
  }

  Widget _buildAnimalDescriptionItem({
    required String description,
    required String title,
  }) {
    return Container(
      width: 90,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xffE1F8F9),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyle.poppins500Medium14.copyWith(
              fontSize: 18,
              color: AppColors.text,
            ),
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: AppTextStyle.poppins500Medium14.copyWith(
              fontSize: 18,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
