import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:influencia/core/config/app_config.dart';
import 'package:influencia/core/constants/app_constants.dart';
import 'package:influencia/core/errors/exceptions.dart';

/// Converte uma [DioException] na [AppException] correspondente.
AppException mapDioExceptionToAppException(DioException exception) {
  return switch (exception.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.sendTimeout ||
    DioExceptionType.receiveTimeout ||
    DioExceptionType.transformTimeout ||
    DioExceptionType.connectionError => const NetworkException(
      message: 'Falha de conexão com o servidor. Verifique sua internet.',
    ),
    DioExceptionType.badResponse => ServerException(
      message: 'O servidor respondeu com um erro.',
      statusCode: exception.response?.statusCode,
    ),
    DioExceptionType.cancel ||
    DioExceptionType.badCertificate ||
    DioExceptionType.unknown => const UnexpectedException(
      message: 'Ocorreu um erro inesperado na requisição.',
    ),
  };
}

/// Interceptor que anexa a [AppException] correspondente ao campo `error`
/// de toda [DioException] emitida pelo Dio.
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err.copyWith(error: mapDioExceptionToAppException(err)));
  }
}

/// Fabrica de [Dio] configurado para o backend Vortex.
Dio createDioClient({String baseUrl = AppConfig.apiBaseUrl}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: AppConstants.connectTimeout,
      receiveTimeout: AppConstants.receiveTimeout,
      sendTimeout: AppConstants.sendTimeout,
    ),
  )..interceptors.add(ErrorInterceptor());
  if (kDebugMode) {
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }
  return dio;
}
