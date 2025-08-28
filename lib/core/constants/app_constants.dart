/// 앱 전체에서 사용되는 상수 정의
class AppConstants {
  // 앱 정보
  static const String appName = 'Ship';
  static const String appVersion = '1.0.0';
  
  // API 관련 상수
  static const int connectionTimeout = 30000; // 30초
  static const int receiveTimeout = 30000; // 30초
  static const int sendTimeout = 30000; // 30초
  
  // 환경 설정
  static const String devEnvironment = 'dev';
  static const String testEnvironment = 'test';
  static const String prodEnvironment = 'prod';
  
  // 저장소 키
  static const String tokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userIdKey = 'user_id';
  static const String themeKey = 'app_theme';
  static const String languageKey = 'app_language';
  
  // 에러 메시지
  static const String defaultErrorMessage = '오류가 발생했습니다. 다시 시도해주세요.';
  static const String networkErrorMessage = '네트워크 연결을 확인해주세요.';
  static const String serverErrorMessage = '서버 오류가 발생했습니다. 잠시 후 다시 시도해주세요.';
  static const String authErrorMessage = '인증이 필요합니다. 다시 로그인해주세요.';
  
  // 라우트 이름
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String profileRoute = '/profile';
  
  // 애니메이션 지속 시간
  static const int shortAnimationDuration = 200; // 밀리초
  static const int mediumAnimationDuration = 400; // 밀리초
  static const int longAnimationDuration = 800; // 밀리초
}
