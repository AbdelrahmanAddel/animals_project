import 'package:animal_task/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:animal_task/features/favorites/presentation/widgets/favorite_body.dart';
import 'package:animal_task/features/home/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<FavoritesCubit>()..loadFavorites(),
        child: FavoriteBody(),
      ),
    );
  }
}
