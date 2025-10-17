import 'package:animal_task/core/theme/app_text_style.dart';
import 'package:animal_task/features/home/presentation/widgets/home_screen_bloc_listner.dart';
import 'package:flutter/material.dart';
import 'package:animal_task/features/home/presentation/widgets/home_header.dart';
import 'package:animal_task/features/home/presentation/widgets/home_search.dart';
import 'package:animal_task/core/common/widgets/app_tab_bar.dart';
import 'package:animal_task/features/home/presentation/widgets/animals_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              HomeHeader(),
              SizedBox(height: 20),
              HomeSearch(),
              SizedBox(height: 20),
              Text(
                'Categories',
                style: AppTextStyle.poppins700Bold24.copyWith(fontSize: 20),
              ),
              SizedBox(height: 14),
              AppTabBar(),
              SizedBox(height: 23),
              AnimalsList(),
              HomeBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
