import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../constants/api_endpoints.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!.options.baseUrl = ApiEndpoints.baseUrl;
      dio!.options.connectTimeout = const Duration(seconds: 60);
      dio!.options.receiveTimeout = const Duration(seconds: 60);
      _dioPrettyLogger();
    }
    return dio!;
  }

  static void _dioPrettyLogger() {
    dio!.interceptors.add(
      PrettyDioLogger(requestBody: true, responseBody: true),
    );
  }
}
