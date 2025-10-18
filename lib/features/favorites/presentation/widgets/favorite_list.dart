import 'package:animal_task/core/common/widgets/states/failure_state_widget.dart';
import 'package:animal_task/core/common/widgets/states/loading_state_widget.dart';
import 'package:animal_task/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:animal_task/features/favorites/presentation/cubit/favorites_state.dart';
import 'package:animal_task/features/favorites/presentation/widgets/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      buildWhen: (previous, current) {
        return current is FavoritesLoaded ||
            current is FavoritesError ||
            current is FavoritesLoading;
      },
      builder: (context, state) {
        return switch (state) {
          FavoritesLoading() => LoadingStateWidget(),
          FavoritesLoaded() => GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.cats.length,
            itemBuilder: (context, index) {
              return FavoriteItem(favoriteItem: state.cats[index]);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 23,
              crossAxisSpacing: 19,
            ),
          ),
          FavoritesError() => ErrorStateWidget(message: state.message),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
