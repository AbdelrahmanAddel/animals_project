import 'package:animal_task/core/error/app_exception.dart';
import 'package:animal_task/core/error/handle_exception.dart';
import 'package:animal_task/core/networking/cat_api_service.dart';
import 'package:animal_task/features/home/data/mapper/cat_mapper.dart';
import 'package:animal_task/features/home/domain/entities/cat_entity.dart';
import 'package:animal_task/features/home/domain/repositories/cat_repository.dart';
import 'package:dartz/dartz.dart';

class CatRepositoryImpl implements CatRepository {
  final CatApiService remoteDataSource;

  CatRepositoryImpl({required this.remoteDataSource});

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
}
