import 'package:animal_task/features/home/data/repositories/cat_repository_impl.dart';
import 'package:animal_task/features/home/domain/repositories/cat_repository.dart';
import 'package:animal_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:dio/dio.dart';

import '../../core/networking/cat_api_service.dart';
import '../../core/networking/dio_factory.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  Dio dio = DioFactory.getDio();
  _home(dio);
}

void _home(Dio dio) {
  sl.registerLazySingleton(() => CatApiService(dio));

  sl.registerLazySingleton<CatRepository>(
    () => CatRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton(() => HomeCubit(sl()));
}
