import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// 민감한 정보를 안전하게 저장하기 위한 클래스
///
/// 토큰, 인증 정보 등 보안이 필요한 데이터를 저장합니다.
class SecureStorage {
  static final SecureStorage _instance = SecureStorage._internal();
  
  factory SecureStorage() => _instance;
  
  SecureStorage._internal();
  
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );
  
  /// 데이터 저장
  Future<void> write({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }
  
  /// 데이터 조회
  Future<String?> read({required String key}) async {
    return await _storage.read(key: key);
  }
  
  /// 데이터 삭제
  Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }
  
  /// 모든 데이터 삭제
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
  
  /// 키 존재 여부 확인
  Future<bool> containsKey({required String key}) async {
    return await _storage.containsKey(key: key);
  }
}
