import 'package:animal_task/features/home/dependency_injection.dart';
import 'package:animal_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:animal_task/features/home/presentation/widgets/home_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => sl<HomeCubit>()
          ..getAllCats()
          ..loadFavorites(),
        child: HomeBody(),
      ),
    );
  }
}
