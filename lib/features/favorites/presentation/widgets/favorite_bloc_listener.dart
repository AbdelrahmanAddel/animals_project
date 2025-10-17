import 'package:animal_task/core/common/widgets/custom_flutter_toast.dart';
import 'package:animal_task/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:animal_task/features/favorites/presentation/cubit/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBlocListener extends StatelessWidget {
  const FavoriteBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoritesCubit, FavoritesState>(
      listenWhen: (previous, current) {
        return current is FavoritesAddOrRemove ||
            current is FavoritesAddOrRemoveError;
      },
      listener: (context, state) {
        if (state is FavoritesAddOrRemove) {
          if (state.isAdded) {
            customFlutterToast(message: 'Added to favorites',isError: false);

          } else {
            customFlutterToast(message: 'Removed from favorites',isError: false);
          }
        } else if (state is FavoritesAddOrRemoveError) {
          customFlutterToast(message: state.message,isError: true);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
