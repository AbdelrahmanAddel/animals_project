import 'package:animal_task/core/constants/api_endpoints.dart';
import 'package:animal_task/features/home/data/models/cat_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'cat_remote_data_source.g.dart';

@RestApi()
abstract class CatApiService {
  factory CatApiService(Dio dio) = _CatApiService;

  @GET(ApiEndpoints.cats)
  Future<List<CatModel>> getCats({
    @Query('limit') int limit = 20,
    @Query('page') int page = 0,
    @Query('has_breeds') bool hasBreeds = true,
  });
}
