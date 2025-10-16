import 'package:animal_task/core/common/data/datasources/common_api_service.dart';
import 'package:animal_task/core/common/data/repositories/favorite_repository_impl.dart';
import 'package:animal_task/core/common/domain/repositories/favorite_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupCommonServiceLocator(Dio dio) {
  // Register common API service
  sl.registerLazySingleton(() => CommonApiService(dio));

  // Register common repositories
  sl.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(apiService: sl()),
  );
}
