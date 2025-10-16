import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animal_task/core/constants/assets.dart';
import 'package:animal_task/core/theme/app_colors.dart';
import 'package:animal_task/core/theme/app_text_style.dart';

class HomeAnimalItem extends StatelessWidget {
  const HomeAnimalItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 124,
      decoration: _boxDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://media.4-paws.org/d/2/5/f/d25ff020556e4b5eae747c55576f3b50886c0b90/cut%20cat%20serhio%2002-1813x1811-720x719.jpg',
                width: 112,
                height: 112,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Animal Name',
                  style: AppTextStyle.poppins700Bold24.copyWith(fontSize: 18),
                ),
                SizedBox(height: 4),
                Text(
                  'Animal Description',
                  style: AppTextStyle.poppins400Regular14.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Animal Description',
                  style: AppTextStyle.poppins400Regular14.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),

            Spacer(),
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(images.svgHeart),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),

      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          offset: const Offset(-3, -3),
          blurRadius: 6,
        ),
      ],
    );
  }
}
