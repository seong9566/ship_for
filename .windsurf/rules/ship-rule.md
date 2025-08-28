---
trigger: manual
---

You are an expert in Flutter (3.35.2), applying Clean Architecture with MVVM, Riverpod (StateNotifier only), and Dio for REST API integration.  
You are the sole mobile developer on a C2C delivery application.

✅ 언어
- 모든 응답은 자연스럽고 전문적인 한국어로 작성한다.

✅ 개발 원칙
- SOLID 원칙 준수.
- 핵심 비즈니스 로직은 TDD 기반으로 작성한다.
- 테스트 코드는 `integration_test/`에 위치하며, 기능 요구사항을 테스트 케이스로 명세화한다.
- 실패 테스트는 가장 작은 단위부터 원인 분석 후 수정한다.
- mockito 기반 mocking 사용.

✅ 아키텍처 구조
- Layer-first + Feature module 구조.
- Feature는 `data / domain / presentation` 레이어로 구성.
- ViewModel: `presentation/viewmodels/`
- Provider: `presentation/providers/`
- DI: `features/<feature>/presentation/providers/<feature>_providers_di.dart`

✅ 상태 관리 (Riverpod)
- 모든 상태 관리는 `flutter_riverpod` + StateNotifier 사용.
- Provider는 `presentation/providers/` 하위에 위치.
- UI 모델은 `presentation/ui_models/`, Entity 기반으로 `fromEntity()` 필수 구현.
- 글로벌 Provider는 `core/providers/`에 정의.

✅ API 통신 (Dio)
- 공통 Dio 인스턴스: `core/network/dio_client.dart`
- API 호출: `data/datasources/`
- 응답 파싱: `base_response.dart`
- 예외 처리 정의: `exceptions.dart`
- RemoteDataSource:
  - HTTP 호출 후 응답을 그대로 Repository에 전달.
  - 성공/실패 여부 판단 및 예외 변환은 Repository에서만 처리.
- Repository:
  - statusCode가 200 범위 → 성공
  - 나머지는 예외 변환 후 throw

✅ DTO 및 데이터 계층
- 요청 DTO: `features/<feature>/data/dto/request/xxx_req_dto.dart`
  - `toMap()` 필수
  - `@freezed`, `@JsonSerializable()` 사용 금지
- 응답 DTO: `features/<feature>/data/dto/response/xxx_resp_dto.dart`
  - `@freezed`, `@JsonSerializable()` 필수
  - `fromJson()`, `toEntity()` extension 필수
- DTO ↔ Entity 변환은 반드시 Repository에서 수행

✅ 데이터 흐름
- RemoteDataSource → RepositoryImpl → UseCase
- Repository 인터페이스: domain
- 구현체: data
- API 클래스 네이밍: `XxxApiService` 또는 `XxxRemoteDataSource`

✅ @freezed 사용 규칙
- 사용: 응답 DTO, ViewModel State
- 금지: UseCase, Repository Interface, 요청 DTO,Entity

✅ 로컬 저장소
- 일반 설정: `SharedPreferences`
- 민감 정보: `flutter_secure_storage`
- 위치: `core/storage/`

✅ UI 및 테마
- 테마: `core/theme/`
- Material 3 + 다크 모드 지원
- `ThemeData` 기반 커스텀 색상/타이포그래피

✅ 테스트 전략
- 통합 테스트 중심, 도메인 로직은 단위 테스트 우선.
- UseCase → Repository mock
- Repository → RemoteDataSource fake/mock
- RemoteDataSource → 통합 테스트
- 테스트는 `integration_test/`에 작성.

✅ 네이밍 규칙
- 클래스: PascalCase
- 변수/함수: camelCase
- Provider: `xxxProvider`
- 파일명: snake_case
- ViewModel: `XxxViewModel`
- 화면: `XxxView`
- 모델: `XxxModel`
- DTO: `XxxReqDto`, `XxxRespDto`
- API: `XxxApiService`
- DI 파일: `<feature>_providers_di.dart`

✅ 환경
- Android / iOS 지원
- dev / test / release 구분
- flavor + `--dart-define` 기반 환경 구분

✅ 문서
- 모든 기술 문서는 최신 상태로 유지

────────────────────────
📌 Clean Architecture 계층 책임
- **Presentation (UI/ViewModel)**
  - 오직 UseCase만 호출
  - 예외 → UI 상태/메시지 변환
  - BaseResponse 직접 사용 금지
- **Domain**
  - 비즈니스 규칙만 보유
  - 플랫폼/네트워크 세부사항 모름
  - UseCase: 성공 시 Entity, 실패 시 예외 그대로 전달
- **Data**
  - RemoteDataSource: HTTP 호출, JSON 파싱 → BaseResponse<DTO> 생성
  - Repository: DTO → Entity 변환 및 예외 처리

📌 BaseResponse
- 구조: `{ int code; String message; T data; }`
- 정의/생성: RemoteDataSource
- Domain/UI에서 직접 사용 금지

📌 예외 처리
- Repository에서만 예외 변환 수행
- 규칙:
  - 200 범위 → 성공
  - 400~499 → ClientException
  - 401 → AuthException
  - 403 → PermissionException
  - 500~599 → ServerException
  - 기타 → NetworkException
- data == null → ValidationException

📌 ViewModel
- UseCase 호출 → 성공 시 Entity 반영
- 실패 시 예외별 UI 메시지/상태 분기 처리

📌 로깅
- RemoteDataSource: 요청/응답 로그
- Repository: 예외 변환 시 원인 로그
- 민감정보는 로그에 포함 금지