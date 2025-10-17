import 'package:animal_task/core/common/domain/repositories/favorite_repository.dart';
import 'package:animal_task/features/favorites/presentation/cubit/favorites_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this.favoriteRepositoryImpl) : super(FavoritesInitial());
  final FavoriteRepository favoriteRepositoryImpl;

  Future<void> loadFavorites() async {
    emit(FavoritesLoading());
    try {
      final cats = await favoriteRepositoryImpl.getFavorites();
      cats.fold((error) => emit(FavoritesError(message: error.message)), (
        cats,
      ) {
        emit(FavoritesLoaded(cats: cats));
      });
    } catch (e) {
      emit(FavoritesError(message: 'Something went wrong'));
    }
  }
}
