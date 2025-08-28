import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/home_providers_di.dart';
import '../ui_models/home_ui_model.dart';
import '../widgets/banner_slider.dart';
import '../widgets/product_grid.dart';

/// 홈 화면 View
class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    // 화면 진입 시 데이터 로드
    Future.microtask(() => ref.read(homeViewModelProvider.notifier).loadHomeData());
  }

  @override
  Widget build(BuildContext context) {
    // 상태 구독
    final state = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(state.homeData?.title ?? '홈'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // 검색 기능 구현 예정
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // 알림 기능 구현 예정
            },
          ),
        ],
      ),
      body: _buildBody(state),
    );
  }

  /// 상태에 따른 화면 구성
  Widget _buildBody(state) {
    // 로딩 상태
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // 오류 상태
    if (state.errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.errorMessage!,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(homeViewModelProvider.notifier).refresh();
              },
              child: const Text('다시 시도'),
            ),
          ],
        ),
      );
    }

    // 데이터가 없는 상태
    if (state.homeData == null) {
      return const Center(
        child: Text('데이터가 없습니다.'),
      );
    }

    // 데이터 표시
    return RefreshIndicator(
      onRefresh: () => ref.read(homeViewModelProvider.notifier).refresh(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 배너 슬라이더
            BannerSlider(banners: state.homeData!.banners),
            
            const SizedBox(height: 16),
            
            // 인기 상품 섹션
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '인기 상품',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ProductGrid(products: state.homeData!.popularProducts),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
