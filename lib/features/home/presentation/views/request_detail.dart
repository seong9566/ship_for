import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ship/core/theme/app_color.dart';

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
  static const double _minSize = 0.15; // 화면 높이의 16% (도착지 아래)
  static const double _initSize = 0.30; // 처음 높이

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
                // const SizedBox(height: 400), // 데모용 여백
              ],
            ),
          ),

          // ===== 드래그 가능한 바텀시트 =====
          DraggableScrollableSheet(
            initialChildSize: _initSize,
            maxChildSize: 0.8,
            minChildSize: _minSize,
            snap: true,
            snapSizes: const [_minSize, _initSize],
            controller: _dragCtrl,

            builder: (context, scrollController) {
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: _buildCommentSection(scrollController),
              );
            },
          ),
        ],
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

  // 댓글 섹션 빌더
  Widget _buildCommentSection(ScrollController sc) {
    return SafeArea(
      bottom: false,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Material(
          color: Colors.white.withValues(alpha: 0.85),
          elevation: 12,
          child: Column(
            children: [
              SizedBox(
                height: 56, // 드래그하기 편한 높이
                child: SingleChildScrollView(
                  controller: sc, // ★ DraggableScrollableSheet의 컨트롤러
                  physics:
                      const AlwaysScrollableScrollPhysics(), // 내용이 적어도 드래그 인식
                  child: Column(
                    children: [
                      // 그랩 핸들
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 8),
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: grey400,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      // 헤더
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: const Text(
                            '댓글 (2)',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 댓글 작성 필드 (이미지 참고)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '댓글 입력',
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: grey500, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: grey500, width: 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    // 전송 버튼
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: grey500,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Divider(height: 1),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: 20,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, i) => _commentItem(
                    isMyComment: i.isEven,
                    content: i.isEven
                        ? '안녕하세요! 저 근처에 있어요.sadvadsvadsvasvdㅁㄴㅇ풤ㄴㅍ아ㅓㅜㅍㅇㅁ나ㅓㅜㅍㅁㅇ너ㅏ'
                        : '오늘 오후 3시 괜찮으세요ㅁㄴㅇ퍼ㅏㅜㄴㅁ아ㅓ푼ㅁ아ㅓ푼마어ㅜ팜너우파ㅓㅜ?',
                    actions: i.isEven ? ['약속잡기', '답글달기'] : [],
                    actionColors: i.isEven
                        ? [pastelGreenColor, pastelBlueColor]
                        : [],
                  ),
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  // 댓글 아이템 위젯
  Widget _commentItem({
    required bool isMyComment,
    required String content,
    required List<String> actions,
    required List<Color> actionColors,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isMyComment) ...[
          CircleAvatar(radius: 16, backgroundColor: grey500),
          const SizedBox(width: 8),
        ],

        // 버블 영역은 항상 전체 폭을 차지하게
        Expanded(
          child: Align(
            alignment: isMyComment
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: ConstrainedBox(
              // 버블의 최대 너비(원하면 조절: 0.8~0.9 정도 추천)
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.85,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: grey300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(content),
                  ),
                  const SizedBox(height: 8),

                  if (actions.isNotEmpty && !actions.contains('작성하기'))
                    Row(
                      mainAxisAlignment: isMyComment
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: List.generate(
                        actions.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: actionColors[index],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              minimumSize: const Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              actions[index],
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),

        // (옵션) 내 댓글에 오른쪽 아바타를 두고 싶다면 여기에 배치
        // if (isMyComment) ...[
        //   const SizedBox(width: 8),
        //   CircleAvatar(radius: 16, backgroundColor: grey500),
        // ],
      ],
    );
  }
}
