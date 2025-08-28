/// 앱 전체에서 사용되는 예외 클래스 정의
/// 
/// 네트워크 요청 및 비즈니스 로직에서 발생하는 예외를 표준화합니다.

/// 기본 앱 예외 클래스
abstract class AppException implements Exception {
  final String message;
  final int? code;
  
  const AppException({
    required this.message,
    this.code,
  });
  
  @override
  String toString() => 'AppException: $message (code: $code)';
}

/// 서버 관련 예외
class ServerException extends AppException {
  const ServerException({
    required String message,
    int? code,
  }) : super(message: message, code: code);
}

/// 클라이언트 관련 예외 (잘못된 요청 등)
class ClientException extends AppException {
  const ClientException({
    required String message,
    int? code,
  }) : super(message: message, code: code);
}

/// 인증 관련 예외 (401)
class AuthException extends AppException {
  const AuthException({
    required String message,
    int? code = 401,
  }) : super(message: message, code: code);
}

/// 권한 관련 예외 (403)
class PermissionException extends AppException {
  const PermissionException({
    required String message,
    int? code = 403,
  }) : super(message: message, code: code);
}

/// 네트워크 관련 예외 (연결 실패 등)
class NetworkException extends AppException {
  const NetworkException({
    required String message,
    int? code,
  }) : super(message: message, code: code);
}

/// 데이터 유효성 검증 예외
class ValidationException extends AppException {
  const ValidationException({
    required String message,
    int? code,
  }) : super(message: message, code: code);
}

/// 캐시 관련 예외
class CacheException extends AppException {
  const CacheException({
    required String message,
    int? code,
  }) : super(message: message, code: code);
}
