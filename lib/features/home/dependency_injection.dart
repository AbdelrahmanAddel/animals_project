import 'package:animal_task/core/common/dependency_injection.dart';
import 'package:animal_task/features/home/data/datasources/home_remote_data_source.dart';
import 'package:animal_task/features/home/data/repositories/home_repository_impl.dart';
import 'package:animal_task/features/home/domain/repositories/cat_repository.dart';
import 'package:animal_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:dio/dio.dart';

import '../../core/networking/dio_factory.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  Dio dio = DioFactory.getDio();

  // Setup common services first
  setupCommonServiceLocator(dio);

  // Then setup home feature
  _home(dio);
}

void _home(Dio dio) {
  sl.registerLazySingleton(() => HomeApiService(dio));

  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton(() => HomeCubit(sl(), sl()));
}
