import 'package:animal_task/core/common/data/datasources/common_api_service.dart';
import 'package:animal_task/core/common/data/repositories/favorite_repository_impl.dart';
import 'package:animal_task/core/common/domain/repositories/favorite_repository.dart';
import 'package:animal_task/features/favorites/presentation/cubit/favorites_cubit.dart';
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

  // Then setup home feature
  _home(dio);
  _favorites(dio);
}

void _home(Dio dio) {
  sl.registerLazySingleton(() => HomeApiService(dio));

  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton(() => HomeCubit(sl(), sl()));
}

void _favorites(Dio dio) {
  sl.registerLazySingleton<CommonApiService>(() => CommonApiService(dio));
  sl.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(apiService: sl()),
  );

  sl.registerLazySingleton<FavoritesCubit>(() => FavoritesCubit(sl()));
}
