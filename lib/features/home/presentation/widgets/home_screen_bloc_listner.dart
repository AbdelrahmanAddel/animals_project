import 'package:animal_task/core/common/widgets/custom_flutter_toast.dart';
import 'package:animal_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:animal_task/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBlocListener extends StatelessWidget {
  const HomeBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) async {
        if (state is HomeErrorState) {
          await customFlutterToast(message: state.message, isError: true);
        }
        if (state is AddFavoriteErrorState) {
          await customFlutterToast(message: state.message, isError: true);
        }
        if (state is AddFavoriteSuccessState) {
          await customFlutterToast(message: 'Added to favorites successfully');
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
