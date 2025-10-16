import 'package:animal_task/core/error/app_exception.dart';
import 'package:animal_task/features/home/data/models/add_to_favourite_body.dart';
import 'package:dartz/dartz.dart';

import '../entities/cat_entity.dart';

abstract class HomeRepository {
  Future<Either<AppException, List<Cat>>> getCats();
  Future<Either<AppException, String>> addFavorite({
    required AddToFavoriteModel body,
  });
}
