import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ship/app.dart';

import 'core/storage/app_preferences.dart';

void main() async {
  // 위젯 바인딩 초기화
  WidgetsFlutterBinding.ensureInitialized();

  // 앱 설정 초기화
  await AppPreferences().init();

  runApp(const ProviderScope(child: MyApp()));
}
