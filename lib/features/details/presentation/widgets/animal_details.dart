import 'package:animal_task/core/theme/app_colors.dart';
import 'package:animal_task/core/theme/app_text_style.dart';
import 'package:animal_task/features/home/domain/entities/cat_entity.dart';
import 'package:flutter/material.dart';

class AnimalDetails extends StatelessWidget {
  const AnimalDetails({super.key, required this.cat});
  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cat.name,
                style: AppTextStyle.poppins700Bold24.copyWith(fontSize: 28),
              ),
              SizedBox(height: 4),
              Text(
                '2.7 km away',
                style: AppTextStyle.poppins400Regular14.copyWith(
                  fontSize: 18,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          Text(
            '\$200',
            style: AppTextStyle.poppins700Bold24.copyWith(
              fontSize: 26,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
