import 'package:animal_task/core/common/widgets/states/failure_state_widget.dart';
import 'package:animal_task/core/common/widgets/states/loading_state_widget.dart';
import 'package:animal_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:animal_task/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:animal_task/features/home/presentation/widgets/home_animal_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimalsList extends StatelessWidget {
  const AnimalsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return current is HomeLoadingState ||
            current is HomeErrorState ||
            current is HomeSuccessState;
      },
      builder: (context, state) {
        switch (state) {
          case HomeLoadingState():
            return LoadingStateWidget();
          case HomeSuccessState():
            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.cats.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return HomeAnimalItem(cat: state.cats[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 12);
              },
            );
          case HomeErrorState():
            return ErrorStateWidget(message: state.message);
          default:
            return SizedBox.shrink();
        }
      },
    );
  }
}
