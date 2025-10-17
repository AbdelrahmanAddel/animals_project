import 'package:animal_task/core/common/data/model/favorites_model.dart';
import 'package:animal_task/core/error/app_exception.dart';
import 'package:animal_task/features/home/data/models/add_to_favourite_body.dart';
import 'package:dartz/dartz.dart';

abstract class FavoriteRepository {
  Future<Either<AppException, List<FavoritesModel>>> getFavorites();
  Future<Either<AppException, void>> addFavorite({
    required AddToFavoriteModel body,
  });
}
