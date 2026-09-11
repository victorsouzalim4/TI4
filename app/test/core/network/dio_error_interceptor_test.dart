import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:influencia/core/config/app_config.dart';
import 'package:influencia/core/constants/app_constants.dart';
import 'package:influencia/core/errors/exceptions.dart';
import 'package:influencia/core/network/dio_client.dart';
import 'package:mocktail/mocktail.dart';

class _MockHttpClientAdapter extends Mock implements HttpClientAdapter;

DioException _dioException(
  DioExceptionType type, {
  Response<dynamic>? response,
}) {
  return DioException(
    requestOptions: RequestOptions(path: '/topics'),
    type: type,
    response: response,
  );
}

void main() {
  setUpAll(() {
    registerFallbackValue(RequestOptions());
  });

  group('mapDioExceptionToAppException', () {
    test('connectionTimeout vira NetworkException', () {
      final exception = mapDioExceptionToAppException(
        _dioException(DioExceptionType.connectionTimeout),
      );
      expect(exception, isA<NetworkException>());
    });

    test('sendTimeout vira NetworkException', () {
      final exception = mapDioExceptionToAppException(
        _dioException(DioExceptionType.sendTimeout),
      );
      expect(exception, isA<NetworkException>());
    });

    test('receiveTimeout vira NetworkException', () {
      final exception = mapDioExceptionToAppException(
        _dioException(DioExceptionType.receiveTimeout),
      );
      expect(exception, isA<NetworkException>());
    });

    test('connectionError vira NetworkException', () {
      final exception = mapDioExceptionToAppException(
        _dioException(DioExceptionType.connectionError),
      );
      expect(exception, isA<NetworkException>());
    });

    test('badResponse vira ServerException com statusCode', () {
      final exception = mapDioExceptionToAppException(
        _dioException(
          DioExceptionType.badResponse,
          response: Response<dynamic>(
            requestOptions: RequestOptions(path: '/topics'),
            statusCode: 500,
          ),
        ),
      );
      expect(
        exception,
        isA<ServerException>().having(
          (serverException) => serverException.statusCode,
          'statusCode',
          500,
        ),
      );
    });

    test('cancel vira UnexpectedException', () {
      final exception = mapDioExceptionToAppException(
        _dioException(DioExceptionType.cancel),
      );
      expect(exception, isA<UnexpectedException>());
    });

    test('badCertificate vira UnexpectedException', () {
      final exception = mapDioExceptionToAppException(
        _dioException(DioExceptionType.badCertificate),
      );
      expect(exception, isA<UnexpectedException>());
    });

    test('unknown vira UnexpectedException', () {
      final exception = mapDioExceptionToAppException(
        _dioException(DioExceptionType.unknown),
      );
      expect(exception, isA<UnexpectedException>());
    });
  });

  group('ErrorInterceptor', () {
    late _MockHttpClientAdapter adapter;
    late Dio dio;

    setUp(() {
      adapter = _MockHttpClientAdapter();
      dio = Dio(BaseOptions(baseUrl: 'http://localhost'))
        ..httpClientAdapter = adapter
        ..interceptors.add(ErrorInterceptor());
    });

    test('resposta 500 emite DioException com ServerException', () async {
      when(
        () => adapter.fetch(any(), any(), any()),
      ).thenAnswer((_) async => ResponseBody.fromString('erro interno', 500));

      await expectLater(
        dio.get<dynamic>('/topics'),
        throwsA(
          isA<DioException>().having(
            (dioException) => dioException.error,
            'error',
            isA<ServerException>().having(
              (serverException) => serverException.statusCode,
              'statusCode',
              500,
            ),
          ),
        ),
      );
    });

    test(
      'timeout de conexao emite DioException com NetworkException',
      () async {
        when(() => adapter.fetch(any(), any(), any())).thenThrow(
          DioException.connectionTimeout(
            timeout: AppConstants.connectTimeout,
            requestOptions: RequestOptions(path: '/topics'),
          ),
        );

        await expectLater(
          dio.get<dynamic>('/topics'),
          throwsA(
            isA<DioException>().having(
              (dioException) => dioException.error,
              'error',
              isA<NetworkException>(),
            ),
          ),
        );
      },
    );

    test('erro desconhecido do adapter emite UnexpectedException', () async {
      when(() => adapter.fetch(any(), any(), any()))
          .thenThrow(_dioException(DioExceptionType.unknown));

      await expectLater(
        dio.get<dynamic>('/topics'),
        throwsA(
          isA<DioException>().having(
            (dioException) => dioException.error,
            'error',
            isA<UnexpectedException>(),
          ),
        ),
      );
    });
  });

  group('createDioClient', () {
    test('configura baseUrl e timeouts a partir do AppConfig', () {
      final dio = createDioClient();

      expect(dio.options.baseUrl, AppConfig.apiBaseUrl);
      expect(dio.options.connectTimeout, AppConstants.connectTimeout);
      expect(dio.options.receiveTimeout, AppConstants.receiveTimeout);
      expect(dio.options.sendTimeout, AppConstants.sendTimeout);
      expect(dio.interceptors.whereType<ErrorInterceptor>().length, 1);
    });
  });
}
