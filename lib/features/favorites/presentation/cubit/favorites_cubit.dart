import 'package:animal_task/core/common/data/model/favorites_model.dart';
import 'package:animal_task/core/common/domain/repositories/favorite_repository.dart';
import 'package:animal_task/features/favorites/presentation/cubit/favorites_state.dart';
import 'package:animal_task/features/home/data/models/add_to_favourite_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this.favoriteRepositoryImpl) : super(FavoritesInitial());
  final FavoriteRepository favoriteRepositoryImpl;
  List<FavoritesModel> cats = [];
  Future<void> loadFavorites() async {
    emit(FavoritesLoading());
    try {
      final cats = await favoriteRepositoryImpl.getFavorites();
      cats.fold((error) => emit(FavoritesError(message: error.message)), (
        cats,
      ) {
        this.cats = cats;
        emit(FavoritesLoaded(cats: cats));
      });
    } catch (e) {
      emit(FavoritesError(message: 'Something went wrong'));
    }
  }

  Future<void> addOrRemoveFavorite(FavoritesModel favorite) async {
    if (cats.any((cat) => cat.id == favorite.id)) {
      _removeFavorite(favorite.id ?? 0);
    } else {
      _addFavorite(
        AddToFavoriteModel(
          id: favorite.id.toString(),
          imageId: favorite.imageId ?? '',
        ),
      );
    }
  }

  Future<void> _addFavorite(AddToFavoriteModel body) async {
    try {
      final cats = await favoriteRepositoryImpl.addFavorite(body: body);
      cats.fold((error) => emit(FavoritesError(message: error.message)), (
        cats,
      ) {
        emit(FavoritesAddOrRemove(isAdded: true));
        loadFavorites();
      });
    } catch (e) {
      emit(FavoritesError(message: 'Something went wrong'));
    }
  }

  Future<void> _removeFavorite(int id) async {
    try {
      final cats = await favoriteRepositoryImpl.removeFavorite(id: id);
      cats.fold((error) => emit(FavoritesError(message: error.message)), (
        cats,
      ) {
        emit(FavoritesAddOrRemove(isAdded: false));
        loadFavorites();
      });
    } catch (e) {
      emit(FavoritesError(message: 'Something went wrong'));
    }
  }
}
