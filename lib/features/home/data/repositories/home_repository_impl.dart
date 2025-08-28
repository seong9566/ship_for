import 'package:dio/dio.dart';
import 'package:ship/features/home/data/dto/response/home_resp_dto.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../domain/entities/home_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

/// Home 리포지토리 구현체
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<HomeEntity> getHomeData() async {
    try {
      final response = await _remoteDataSource.getHomeData();

      // 성공 응답 처리
      if (response.isSuccess && response.data != null) {
        return response.data!.toEntity();
      } else {
        // data가 null인 경우 ValidationException 발생
        throw ValidationException(
          message: response.message,
          code: response.code,
        );
      }
    } on DioException catch (e) {
      // Dio 예외 처리 및 변환
      // TODO: 로깅 시스템 적용 필요 (Logger 패키지 사용 권장)
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        final message = e.response!.statusMessage ?? '알 수 없는 오류가 발생했습니다.';

        if (statusCode == 401) {
          throw AuthException(message: message, code: statusCode);
        } else if (statusCode == 403) {
          throw PermissionException(message: message, code: statusCode);
        } else if (statusCode! >= 400 && statusCode < 500) {
          throw ClientException(message: message, code: statusCode);
        } else if (statusCode >= 500) {
          throw ServerException(message: message, code: statusCode);
        }
      }

      throw NetworkException(message: e.message ?? '네트워크 오류가 발생했습니다.');
    } catch (e) {
      // 기타 예외 처리
      // TODO: 로깅 시스템 적용 필요 (Logger 패키지 사용 권장)
      if (e is AppException) {
        rethrow;
      }

      throw ServerException(message: '서버 오류가 발생했습니다.');
    }
  }
}
