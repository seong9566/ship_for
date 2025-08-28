import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ship/features/auth/login/presentation/view/login_view.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: shellKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'login',
      builder: (context, state) => const LoginView(),
    ),
  ],
);
