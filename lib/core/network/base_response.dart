/// API 응답의 표준 형식을 정의하는 클래스
///
/// 서버 응답의 일관된 구조를 제공합니다.
/// 모든 API 응답은 이 클래스를 통해 파싱됩니다.
class BaseResponse<T> {
  /// 응답 코드 (성공: 200 범위)
  final int code;
  
  /// 응답 메시지
  final String message;
  
  /// 응답 데이터
  final T? data;
  
  const BaseResponse({
    required this.code,
    required this.message,
    this.data,
  });
  
  /// JSON에서 BaseResponse 객체 생성
  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json)? fromJsonT,
  ) {
    return BaseResponse<T>(
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] != null && fromJsonT != null
          ? fromJsonT(json['data'] as Map<String, dynamic>)
          : null,
    );
  }
  
  /// 성공 여부 확인
  bool get isSuccess => code >= 200 && code < 300;
}
