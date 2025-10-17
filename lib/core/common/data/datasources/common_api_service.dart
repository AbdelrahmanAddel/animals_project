import 'package:animal_task/core/common/data/model/favorites_model.dart';
import 'package:animal_task/core/constants/api_endpoints.dart';
import 'package:animal_task/features/home/data/models/add_to_favourite_body.dart';
import 'package:animal_task/features/home/data/models/cat_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'common_api_service.g.dart';

@RestApi()
abstract class CommonApiService {
  factory CommonApiService(Dio dio) = _CommonApiService;

  @GET(ApiEndpoints.favorites)
  Future<List<FavoritesModel>> getFavorites();

  @POST(ApiEndpoints.favorites)
  Future<void> addFavorite({@Body() required AddToFavoriteModel body});
}
