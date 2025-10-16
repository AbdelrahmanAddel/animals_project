import 'package:animal_task/features/home/domain/entities/cat_entity.dart';

sealed class HomeState {}

final class HomeInitState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {
  final List<Cat> cats;
  HomeSuccessState(this.cats);
}

final class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState(this.message);
}
