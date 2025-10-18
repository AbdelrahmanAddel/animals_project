import 'package:animal_task/core/common/domain/repositories/favorite_repository.dart';
import 'package:animal_task/features/home/data/models/add_to_favourite_body.dart';
import 'package:animal_task/features/home/domain/entities/cat_entity.dart';
import 'package:animal_task/features/home/domain/repositories/home_repository.dart';
import 'package:animal_task/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository catRepository;
  final FavoriteRepository favoriteRepository;
  HomeCubit(this.catRepository, this.favoriteRepository)
    : super(HomeInitState());

  List<Cat> _cats = [];
  List<String> _favoriteIds = [];

  void getAllCats() async {
    if (isClosed) return;
    emit(HomeLoadingState());
    try {
      final response = await catRepository.getCats();
      response.fold((error) => emit(HomeErrorState(error.message)), (success) {
        _cats = success;
        emit(HomeSuccessState(success));
      });
    } on Exception catch (_) {
      emit(HomeErrorState('Something went wrong'));
    }
  }

  void searchCats(String query) {
    try {
      if (_cats.isEmpty) return;
      final response = _cats.where((cat) {
        final name = cat.name.toLowerCase();
        final search = query.toLowerCase();

        return name.contains(search);
      }).toList();
      emit(SearchSuccessState(cats: response));
    } on Exception catch (_) {
      emit(SearchFailureState(message: 'Something went wrong'));
    }
  }

  Future<void> addFavorite({required AddToFavoriteModel body}) async {
    if (isClosed) return;
    emit(AddFavoriteLoadingState());
    try {
      final response = await favoriteRepository.addFavorite(body: body);
      response.fold((error) => emit(AddFavoriteErrorState(error.message)), (
        success,
      ) {
        _favoriteIds.add(body.imageId);
        emit(AddFavoriteSuccessState());
      });
    } on Exception catch (_) {
      emit(AddFavoriteErrorState('Something went wrong'));
    }
  }

  Future<void> loadFavorites() async {
    if (isClosed) return;
    emit(HomeLoadingState());
    try {
      final response = await favoriteRepository.getFavorites();
      response.fold((error) => emit(HomeErrorState(error.message)), (success) {
        _favoriteIds = success.map((fav) => fav.imageId!).toList();
        emit(HomeSuccessState(_cats));
      });
    } on Exception catch (_) {
      emit(HomeErrorState('Something went wrong'));
    }
  }

  bool isFavorite(String imageId) {
    return _favoriteIds.contains(imageId);
  }
}
