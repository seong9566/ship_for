// 상단 그랩 핸들(잡아서 키우고 줄이기)
import 'package:flutter/material.dart';

class GrabHandle extends StatelessWidget {
  const GrabHandle({required this.onDrag, super.key});
  final void Function(double deltaDy) onDrag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, // 빈 공간도 터치
      onVerticalDragUpdate: (d) => onDrag(d.primaryDelta ?? 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 12),
        child: Center(
          child: Container(
            width: 44,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ),
    );
  }
}
