import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ship/features/home/presentation/providers/home_providers_di.dart';

import '../../../../core/theme/app_color.dart';

class HomeBottomNavWidget extends ConsumerStatefulWidget {
  const HomeBottomNavWidget({super.key});

  @override
  ConsumerState<HomeBottomNavWidget> createState() =>
      _HomeBottomNavWidgetState();
}

class _HomeBottomNavWidgetState extends ConsumerState<HomeBottomNavWidget> {
  @override
  Widget build(BuildContext context) {
    final index = ref.watch(homeViewModelProvider).bottomNavIndex;
    final vm = ref.read(homeViewModelProvider.notifier);
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: index,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: grey700,
            onTap: (index) {
              vm.changeIndex(index);
            },
            items: [
              _bottomNavItem(Icon(Icons.home), "홈"),
              _bottomNavItem(Icon(Icons.mail), "내 요청"),
              _bottomNavItem(Icon(Icons.account_circle), "내 정보"),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavItem(Icon icon, String label) {
    return BottomNavigationBarItem(icon: icon, label: label);
  }
}
