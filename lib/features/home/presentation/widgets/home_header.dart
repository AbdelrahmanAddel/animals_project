import 'package:flutter/material.dart';
import 'package:animal_task/core/theme/app_colors.dart';
import 'package:animal_task/core/theme/app_text_style.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Find Your Forever Pet', style: AppTextStyle.poppins700Bold24),

        Icon(Icons.notifications, color: AppColors.text),
      ],
    );
  }
}
