import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ship/core/theme/app_color.dart';
import 'package:ship/features/home/presentation/widgets/home_bottom_nav_widget.dart';
import 'package:ship/features/home/presentation/widgets/main_request_list.dart';
import 'package:ship/features/home/presentation/providers/home_providers_di.dart';
import 'package:ship/features/my_request/presentation/views/my_request_view.dart';
import 'package:ship/features/profile/presentation/views/profile_view.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final index = ref.watch(homeViewModelProvider).bottomNavIndex;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: _mainAppBar(),
        body: IndexedStack(
          index: index,
          children: [
            MainRequestList(),
            const MyRequestView(),
            const ProfileView(),
          ],
        ),
        floatingActionButton: index == 0 ? _fabBtn() : null,
        bottomNavigationBar: HomeBottomNavWidget(),
      ),
    );
  }

  FloatingActionButton _fabBtn() {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      backgroundColor: grey800,
      onPressed: () {},
      child: const Icon(Icons.add, color: Colors.white),
    );
  }

  AppBar _mainAppBar() {
    return AppBar(
      centerTitle: false,

      title: Text(
        'SHIP-8',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined, color: Colors.black),
          onPressed: () {},
        ),

        IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }
}
