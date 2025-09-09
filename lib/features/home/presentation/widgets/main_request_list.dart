import 'package:flutter/material.dart';
import 'package:ship/features/home/presentation/widgets/header.dart';
import 'package:ship/features/home/presentation/widgets/request_item.dart';

import '../../../../core/theme/app_color.dart';

class MainRequestList extends StatelessWidget {
  const MainRequestList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: FixedHeader(height: 80, child: _locationWidget()),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverList.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const RequestItem();
          },
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
          Row(
            children: [
              Expanded(
                child: SizedBox(
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
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '변경',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
