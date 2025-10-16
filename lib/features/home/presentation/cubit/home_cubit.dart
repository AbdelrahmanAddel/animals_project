import 'package:animal_task/features/home/data/models/add_to_favourite_body.dart';
import 'package:animal_task/features/home/domain/entities/cat_entity.dart';
import 'package:animal_task/features/home/domain/repositories/cat_repository.dart';
import 'package:animal_task/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository catRepository;
  HomeCubit(this.catRepository) : super(HomeInitState());
  List<Cat> _cats = [];
  void getAllCats() async {
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
    emit(AddFavoriteLoadingState());
    try {
      final response = await catRepository.addFavorite(body: body);
      response.fold((error) => emit(AddFavoriteErrorState(error.message)), (
        success,
      ) {
        emit(AddFavoriteSuccessState());
      });
    } on Exception catch (_) {
      emit(AddFavoriteErrorState('Something went wrong'));
    }
  }
}
