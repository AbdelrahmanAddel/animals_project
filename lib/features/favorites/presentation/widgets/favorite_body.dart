import 'package:animal_task/core/common/widgets/app_tab_bar.dart';
import 'package:animal_task/core/theme/app_text_style.dart';
import 'package:animal_task/features/favorites/presentation/widgets/favorite_bloc_listener.dart';
import 'package:animal_task/features/favorites/presentation/widgets/favorite_list.dart';
import 'package:flutter/material.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Your Favorite Pets',
                style: AppTextStyle.poppins700Bold24,
              ),
            ),
            SizedBox(height: 20),
            AppTabBar(),
            SizedBox(height: 22),
            FavoriteList(),
            FavoriteBlocListener(),
          ],
        ),
      ),
    );
  }
}
