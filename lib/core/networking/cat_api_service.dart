import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../features/home/data/models/cat_model.dart';

part 'cat_api_service.g.dart';

@RestApi()
abstract class CatApiService {
  factory CatApiService(Dio dio, {String baseUrl}) = _CatApiService;

  @GET('/v1/images/search')
  Future<List<CatModel>> getCats({
    @Query('has_breeds') bool hasBreeds = true,
    @Query('order') String order = 'RANDOM',
    @Query('page') int page = 0,
    @Query('limit') int limit = 20,
  });
}
