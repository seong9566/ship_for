import 'package:dio/dio.dart';

/// Dio HTTP 클라이언트 설정
/// 
/// 모든 API 요청에 사용되는 공통 Dio 인스턴스를 제공합니다.
class DioClient {
  static Dio? _instance;
  
  /// 싱글톤 Dio 인스턴스 반환
  static Dio get instance {
    _instance ??= _createDio();
    return _instance!;
  }
  
  /// Dio 인스턴스 생성 및 기본 설정
  static Dio _createDio() {
    final dio = Dio();
    
    // 기본 설정
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      contentType: 'application/json',
      responseType: ResponseType.json,
    );
    
    // 인터셉터 추가
    dio.interceptors.add(_createLoggingInterceptor());
    
    return dio;
  }
  
  /// 로깅 인터셉터 생성
  static Interceptor _createLoggingInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        print('REQUEST[${options.method}] => PATH: ${options.path}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        print('ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}');
        return handler.next(e);
      },
    );
  }
  
  /// 환경별 baseUrl 설정
  static void setBaseUrl(String baseUrl) {
    instance.options.baseUrl = baseUrl;
  }
}
