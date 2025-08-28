import 'package:shared_preferences/shared_preferences.dart';

/// 일반 설정 및 비민감 정보를 저장하기 위한 클래스
///
/// 앱 설정, 사용자 기본 설정 등을 저장합니다.
class AppPreferences {
  static final AppPreferences _instance = AppPreferences._internal();
  static SharedPreferences? _prefs;
  
  factory AppPreferences() => _instance;
  
  AppPreferences._internal();
  
  /// SharedPreferences 초기화
  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }
  
  /// String 값 저장
  Future<bool> setString(String key, String value) async {
    await _ensureInitialized();
    return await _prefs!.setString(key, value);
  }
  
  /// String 값 조회
  String getString(String key, {String defaultValue = ''}) {
    _ensureInitializedSync();
    return _prefs!.getString(key) ?? defaultValue;
  }
  
  /// int 값 저장
  Future<bool> setInt(String key, int value) async {
    await _ensureInitialized();
    return await _prefs!.setInt(key, value);
  }
  
  /// int 값 조회
  int getInt(String key, {int defaultValue = 0}) {
    _ensureInitializedSync();
    return _prefs!.getInt(key) ?? defaultValue;
  }
  
  /// bool 값 저장
  Future<bool> setBool(String key, bool value) async {
    await _ensureInitialized();
    return await _prefs!.setBool(key, value);
  }
  
  /// bool 값 조회
  bool getBool(String key, {bool defaultValue = false}) {
    _ensureInitializedSync();
    return _prefs!.getBool(key) ?? defaultValue;
  }
  
  /// 키 삭제
  Future<bool> remove(String key) async {
    await _ensureInitialized();
    return await _prefs!.remove(key);
  }
  
  /// 모든 데이터 삭제
  Future<bool> clear() async {
    await _ensureInitialized();
    return await _prefs!.clear();
  }
  
  /// 초기화 확인 (비동기)
  Future<void> _ensureInitialized() async {
    if (_prefs == null) {
      await init();
    }
  }
  
  /// 초기화 확인 (동기)
  void _ensureInitializedSync() {
    if (_prefs == null) {
      throw StateError('AppPreferences가 초기화되지 않았습니다. init()을 먼저 호출하세요.');
    }
  }
}
