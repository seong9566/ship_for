import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ship/core/router/router_names.dart';
import 'package:ship/core/theme/app_color.dart' as AppColor;

class RequestItem extends StatelessWidget {
  const RequestItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouterNames.RequestDetailPage);
      },
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.waitingColor,
                  ),
                  child: Text('대기중', style: TextStyle(fontSize: 14)),
                ),
                Text(
                  '8시간 전',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: AppColor.grey600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            /// 요청 정보
            SizedBox(
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 사진 영역
                  Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: AppColor.grey300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: 16),

                  /// 요청 정보 영역
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            '서류 봉투좀 보내주실분!',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Column(
                          children: [
                            _location(
                              icon: Icon(
                                Icons.location_on_outlined,
                                color: AppColor.pastelPurpleColor,
                              ),
                              location: '출발지 : 서울 특별시 관악구 조원로 17길 26',
                            ),
                            SizedBox(height: 8),
                            _location(
                              icon: Icon(
                                Icons.location_on_outlined,
                                color: AppColor.pastelRedColor,
                              ),
                              location: '도착지 : 서울 특별시 강남구 개포로 619',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: AppColor.grey800,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
