import '../entities/home_entity.dart';
import '../repositories/home_repository.dart';

/// 홈 화면 데이터 조회 UseCase
/// 
/// 홈 화면에 필요한 데이터를 조회하는 비즈니스 로직을 담당합니다.
class GetHomeDataUseCase {
  final HomeRepository _repository;
  
  GetHomeDataUseCase(this._repository);
  
  /// 홈 화면 데이터 조회 실행
  /// 
  /// 성공 시 [HomeEntity] 반환
  /// 실패 시 예외를 그대로 전달
  Future<HomeEntity> execute() async {
    return await _repository.getHomeData();
  }
}
