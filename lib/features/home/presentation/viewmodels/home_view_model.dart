import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../domain/usecases/get_home_data_usecase.dart';
import '../ui_models/home_ui_model.dart';

part 'home_view_model.freezed.dart';

/// 홈 화면 상태
@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(null) HomeUiModel? homeData,
    @Default(null) String? errorMessage,
    @Default(0) int bottomNavIndex,
  }) = _HomeState;
}

/// 홈 화면 ViewModel
class HomeViewModel extends StateNotifier<HomeState> {
  final GetHomeDataUseCase _getHomeDataUseCase;

  HomeViewModel(this._getHomeDataUseCase) : super(const HomeState());

  void changeIndex(int index) {
    state = state.copyWith(bottomNavIndex: index);
  }

  /// 홈 화면 데이터 로드
  Future<void> loadHomeData() async {
    try {
      // 로딩 상태 설정
      state = state.copyWith(isLoading: true, errorMessage: null);

      // UseCase 호출
      final homeEntity = await _getHomeDataUseCase.execute();

      // 성공 시 UI 모델로 변환하여 상태 업데이트
      state = state.copyWith(
        isLoading: false,
        homeData: HomeUiModelX.fromEntity(homeEntity),
      );
    } on AppException catch (e) {
      // 예외 유형별 메시지 처리
      String errorMessage;

      if (e is NetworkException) {
        errorMessage = '네트워크 연결을 확인해주세요.';
      } else if (e is ServerException) {
        errorMessage = '서버 오류가 발생했습니다. 잠시 후 다시 시도해주세요.';
      } else if (e is AuthException) {
        errorMessage = '로그인이 필요합니다.';
      } else if (e is ValidationException) {
        errorMessage = '데이터 형식이 올바르지 않습니다.';
      } else {
        errorMessage = e.message;
      }

      // 오류 상태 업데이트
      state = state.copyWith(isLoading: false, errorMessage: errorMessage);
    } catch (e) {
      // 기타 예외 처리
      state = state.copyWith(
        isLoading: false,
        errorMessage: '알 수 없는 오류가 발생했습니다.',
      );
    }
  }

  /// 새로고침
  Future<void> refresh() async {
    await loadHomeData();
  }
}
