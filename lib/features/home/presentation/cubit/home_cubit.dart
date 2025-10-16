import 'package:animal_task/features/home/domain/repositories/cat_repository.dart';
import 'package:animal_task/features/home/presentation/cubit/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final CatRepository catRepository;
  HomeCubit(this.catRepository) : super(HomeInitState());
  getAllCats() async {
    emit(HomeLoadingState());
    try {
      final response = await catRepository.getCats();
      response.fold(
        (error) => emit(HomeErrorState(error.message)),
        (success) => emit(HomeSuccessState(success)),
      );
    } on Exception catch (e) {
      print('Error => $e');
      emit(HomeErrorState('Something went wrong'));
    }
  }
}
