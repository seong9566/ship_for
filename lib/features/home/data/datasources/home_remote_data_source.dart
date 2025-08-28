import 'package:dio/dio.dart';
import '../../../../core/network/base_response.dart';
import '../dto/response/home_resp_dto.dart';

/// Home 화면 관련 원격 데이터 소스
/// 
/// API 호출을 담당하며, 응답을 BaseResponse 형태로 반환합니다.
class HomeRemoteDataSource {
  final Dio _dio;
  
  HomeRemoteDataSource(this._dio);
  
  /// 홈 화면 데이터 조회
  Future<BaseResponse<HomeRespDto>> getHomeData() async {
    try {
      final response = await _dio.get('/home');
      
      return BaseResponse.fromJson(
        response.data,
        (json) => HomeRespDto.fromJson(json),
      );
    } catch (e) {
      // 로깅만 수행하고 예외는 그대로 전달
      print('HomeRemoteDataSource - getHomeData 오류: $e');
      rethrow;
    }
  }
}
