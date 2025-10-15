import 'package:animal_task/core/error/app_exception.dart';
import 'package:dartz/dartz.dart';

import '../entities/cat_entity.dart';

abstract class CatRepository {
  Future<Either<AppException, List<Cat>>> getCats();
}
