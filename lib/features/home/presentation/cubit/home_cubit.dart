import 'package:animal_task/features/home/domain/entities/cat_entity.dart';
import 'package:animal_task/features/home/domain/repositories/cat_repository.dart';
import 'package:animal_task/features/home/presentation/cubit/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final CatRepository catRepository;
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
}
