import 'package:flutter/material.dart';

class FixedHeader extends SliverPersistentHeaderDelegate {
  FixedHeader({required this.height, required this.child});
  final double height;
  final Widget child;

  @override
  double get minExtent => height;
  @override
  double get maxExtent => height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(color: Colors.white, child: child); // 배경색 유지
  }

  @override
  bool shouldRebuild(covariant FixedHeader old) =>
      old.height != height || old.child != child;
}
