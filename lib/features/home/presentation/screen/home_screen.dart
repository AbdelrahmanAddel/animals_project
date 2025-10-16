import 'package:animal_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:animal_task/core/theme/app_text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: HomeBody());
  }
}

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
              HomeCategory(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeCategory extends StatelessWidget {
  const HomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: AppTextStyle.poppins700Bold24.copyWith(fontSize: 20),
        ),
        SizedBox(height: 14),
        

        
      ],
    );
  }
}

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Color(0xffF6F6F6),
        filled: true,
        hintText: 'Search',
        prefixIcon: Icon(Icons.search, color: AppColors.textColor),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Find Your Forever Pet', style: AppTextStyle.poppins700Bold24),

        Icon(Icons.notifications, color: AppColors.textColor),
      ],
    );
  }
}
