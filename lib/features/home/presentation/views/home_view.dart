import 'package:flutter/material.dart';
import 'package:ship/core/theme/app_color.dart';
import 'package:ship/features/home/presentation/widgets/header.dart';
import 'package:ship/features/home/presentation/widgets/request_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: _mainAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: FixedHeader(height: 80, child: _locationWidget()),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverList.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return RequestItem();
              },
            ),
          ],
        ),
        floatingActionButton: _fabBtn(),
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

  Widget _locationWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.location_on_outlined, color: grey800),
              Text(
                '현재 위치',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          /// 추후 페이지로 이동 시키기
          SizedBox(
            height: 42,
            child: TextField(
              cursorColor: grey800,
              cursorWidth: 1.5,
              cursorHeight: 16.0,
              cursorRadius: const Radius.circular(2),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: grey400),
                ),
                hintText: '장소,주소를 입력해보세요.',
                hintStyle: TextStyle(color: grey600, fontSize: 14),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: grey400),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: grey400),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
