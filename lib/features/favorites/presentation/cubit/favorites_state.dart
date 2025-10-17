import 'package:animal_task/core/common/data/model/favorites_model.dart';

sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  final List<FavoritesModel> cats;

  FavoritesLoaded({required this.cats});
}

final class FavoritesError extends FavoritesState {
  final String message;

  FavoritesError({required this.message});
}

final class FavoritesAddOrRemove extends FavoritesState {
  final bool isAdded;

  FavoritesAddOrRemove({required this.isAdded});
}

final class FavoritesAddOrRemoveLoading extends FavoritesState {}

final class FavoritesAddOrRemoveError extends FavoritesState {
  final String message;

  FavoritesAddOrRemoveError({required this.message});
}
