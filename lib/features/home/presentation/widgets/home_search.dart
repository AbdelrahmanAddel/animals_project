import 'package:animal_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:animal_task/core/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSearch extends StatelessWidget {
  HomeSearch({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      onChanged: (value) {
        context.read<HomeCubit>().searchCats(value);
      },
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
