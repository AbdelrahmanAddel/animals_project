import 'package:flutter/material.dart';
import 'package:animal_task/core/theme/app_colors.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Color(0xffF6F6F6),
        filled: true,
        hintText: 'Search',
        prefixIcon: Icon(Icons.search, color: AppColors.text),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
