import 'package:flutter/material.dart';
import 'package:ship/core/theme/app_color.dart';
import 'package:ship/features/home/presentation/widgets/grab_handle.dart';

class RequestDetail extends StatefulWidget {
  const RequestDetail({super.key});

  @override
  State<RequestDetail> createState() => _RequestDetailState();
}

class _RequestDetailState extends State<RequestDetail> {
  List<String> images = [
    'https://picsum.photos/seed/picsum/200',
    'https://picsum.photos/200',
    'https://picsum.photos/id/237/200',
  ];

  int _currentIndex = 0;

  final _dragCtrl = DraggableScrollableController();

  // 원하는 스냅/사이즈
  static const double _minSize = 0.16; // 화면 높이의 16%
  static const double _initSize = 0.28; // 처음 높이
  static const double _midSize = 0.55; // 중간 스냅
  static const double _maxSize = 0.9; // 최대

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          // 본문은 뒤에 깔림 (필요하면 하단 패딩 조금)
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                _header(),
                const SizedBox(height: 16),
                _images(),
                const SizedBox(height: 16),
                _requestInfo(),
                const SizedBox(height: 400), // 데모용 여백
              ],
            ),
          ),

          // ===== 드래그 가능한 바텀시트 =====
          Positioned.fill(
            bottom: 0,
            child: DraggableScrollableSheet(
              controller: _dragCtrl,
              expand: false, // Stack 위에서 원하는 비율로만 차지
              minChildSize: _minSize,
              initialChildSize: _initSize,
              maxChildSize: _maxSize,
              snap: true,
              snapSizes: const [_initSize, _midSize, _maxSize],
              builder: (context, scrollController) {
                return Material(
                  elevation: 12,
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      // --- 그랩 핸들 영역(빨간 박스 자리) ---
                      GrabHandle(
                        onDrag: (deltaDy) {
                          final h = MediaQuery.of(context).size.height;
                          final next = (_dragCtrl.size - deltaDy / h).clamp(
                            _minSize,
                            _maxSize,
                          );
                          _dragCtrl.jumpTo(next);
                        },
                      ),
                      // 고정 헤더(옵션)
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '요청자 정보',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // --- 내부 스크롤 영역 ---
                      Expanded(
                        child: ListView.separated(
                          controller: scrollController, // ★ 중요: 이 컨트롤러 사용!
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          itemCount: 20,
                          separatorBuilder: (_, __) =>
                              const Divider(height: 16),
                          itemBuilder: (context, i) => ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text('아이템 ${i + 1}'),
                            subtitle: const Text('세부 내용..'),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _stickyScrollableSheet() {
    return SafeArea(
      top: false,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 8),

            // 고정 헤더(선택)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Text('요청자 정보', style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 8),

            Expanded(
              child: ScrollConfiguration(
                behavior: const ScrollBehavior(),
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  itemCount: 20,
                  separatorBuilder: (_, __) => const Divider(height: 16),
                  itemBuilder: (context, i) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('아이템 ${i + 1}'),
                    subtitle: const Text('세부 내용..'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _requestInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '서류 봉투좀 보내주실분!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            overflow: TextOverflow.visible,
          ),
          SizedBox(height: 8),
          Text(
            '서류를 어쩌고 저쩌고 보내야하는데 어쩌고 저쩌고..',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            overflow: TextOverflow.visible,
          ),
          SizedBox(height: 80),

          _location(
            icon: Icon(Icons.location_on_outlined, color: pastelPurpleColor),
            location: '출발지 : 서울 특별시 관악구 조원로 17길 26',
          ),
          SizedBox(height: 16),
          _location(
            icon: Icon(Icons.location_on_outlined, color: pastelRedColor),
            location: '도착지 : 서울 특별시 강남구 개포로 619',
          ),
        ],
      ),
    );
  }

  Widget _location({required Widget icon, required String location}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon,
        SizedBox(width: 4),
        Flexible(
          child: Text(
            location,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Widget _images() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(color: grey300),
          child: PageView.builder(
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.network(images[index], fit: BoxFit.cover);
            },
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: Container(
            width: 56,
            height: 28,
            decoration: BoxDecoration(
              color: grey200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '${_currentIndex + 1}/${images.length}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: waitingColor,
            ),
            child: Text('대기중', style: TextStyle(fontSize: 14)),
          ),
          Text(
            '8시간 전',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
