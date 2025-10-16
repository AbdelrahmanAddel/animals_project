import 'package:animal_task/core/error/app_exception.dart';
import 'package:animal_task/core/error/handle_exception.dart';
import 'package:animal_task/features/home/data/datasources/home_remote_data_source.dart';
import 'package:animal_task/features/home/data/mapper/cat_mapper.dart';
import 'package:animal_task/features/home/data/models/add_to_favourite_body.dart';
import 'package:animal_task/features/home/domain/entities/cat_entity.dart';
import 'package:animal_task/features/home/domain/repositories/cat_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeApiService remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<AppException, List<Cat>>> getCats() async {
    try {
      final catModels = await remoteDataSource.getCats();
      final cats = catModels.map((cats) => CatMapper.toEntity(cats)).toList();
      return Right(cats);
    } catch (e) {
      return Left(HandledException.handle(e));
    }
  }

  @override
  Future<Either<AppException, String>> addFavorite({
    required AddToFavoriteModel body,
  }) async {
    try {
      await remoteDataSource.addFavorite(body: body);
      return Right('Added to favorites');
    } catch (e) {
      return Left(HandledException.handle(e));
    }
  }
}
