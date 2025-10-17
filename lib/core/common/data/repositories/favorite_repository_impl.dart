import 'package:animal_task/core/common/data/datasources/common_api_service.dart';
import 'package:animal_task/core/common/data/model/favorites_model.dart';
import 'package:animal_task/core/common/domain/repositories/favorite_repository.dart';
import 'package:animal_task/core/error/app_exception.dart';
import 'package:animal_task/core/error/handle_exception.dart';
import 'package:animal_task/features/home/data/models/add_to_favourite_body.dart';
import 'package:dartz/dartz.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final CommonApiService apiService;

  FavoriteRepositoryImpl({required this.apiService});

  @override
  Future<Either<AppException, List<FavoritesModel>>> getFavorites() async {
    try {
      final response = await apiService.getFavorites();

      return Right(response);
    } catch (e) {
      return Left(HandledException.handle(e));
    }
  }

  @override
  Future<Either<AppException, void>> addFavorite({
    required AddToFavoriteModel body,
  }) async {
    try {
      await apiService.addFavorite(body: body);
      return Right(null);
    } catch (e) {
      return Left(HandledException.handle(e));
    }
  }
}
