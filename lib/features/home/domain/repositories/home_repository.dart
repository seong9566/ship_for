import '../entities/home_entity.dart';

/// Home 리포지토리 인터페이스
/// 
/// 홈 화면 관련 데이터 접근을 위한 추상화 계층
abstract class HomeRepository {
  /// 홈 화면 데이터 조회
  /// 
  /// 성공 시 [HomeEntity] 반환
  /// 실패 시 예외 발생
  Future<HomeEntity> getHomeData();
}
