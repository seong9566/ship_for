import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ship/features/auth/login/presentation/view/login_view.dart';
import 'package:ship/features/auth/sign/presentation/view/sign_view.dart';
import 'package:ship/features/home/presentation/views/home_view.dart';
import 'package:ship/features/home/presentation/views/request_detail.dart';

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
    GoRoute(
      path: '/sign',
      name: 'sign',
      builder: (context, state) => const SignView(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/request_detail',
      name: 'request_detail',
      builder: (context, state) => const RequestDetail(),
    ),
  ],
);
