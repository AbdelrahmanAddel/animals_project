import 'package:animal_task/core/error/app_exception.dart';
import 'package:dio/dio.dart';

class HandledException {
  static AppException handle(dynamic e) {
    if (e is DioException) {
      return _handleDioException(e);
    } else if (e is AppException) {
      return e;
    } else {
      return const AppException(
        'Something went wrong. Please try again later.',
      );
    }
  }

  static AppException _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const AppException('Connection timed out. Please try again.');
      case DioExceptionType.sendTimeout:
        return const AppException('Request took too long to send. Try again.');
      case DioExceptionType.receiveTimeout:
        return const AppException('The server took too long to respond.');
      case DioExceptionType.connectionError:
        return const AppException('Please check your internet connection.');
      case DioExceptionType.badResponse:
        return _handleBadResponse(e.response?.statusCode);
      case DioExceptionType.cancel:
        return const AppException('Request was cancelled.');
      case DioExceptionType.unknown:
        return const AppException('An unexpected error occurred. Try again.');
      case DioExceptionType.badCertificate:
        return const AppException(
          'Secure connection failed. Please try again.',
        );
    }
  }

  static AppException _handleBadResponse(int? statusCode) {
    switch (statusCode) {
      case 400:
        return const AppException('Invalid request. Please try again.');
      case 401:
        return const AppException('You are not authorized. Please log in.');
      case 403:
        return const AppException('Access denied. You don’t have permission.');
      case 404:
        return const AppException('Resource not found. Please try again.');
      case 500:
        return const AppException('Server error. Please try again later.');
      case 502:
        return const AppException('Bad gateway. Please try again later.');
      case 503:
        return const AppException('Service temporarily unavailable.');
      case 504:
        return const AppException('Server timeout. Please try again.');
      default:
        return const AppException('Something went wrong. Please try again.');
    }
  }
}
