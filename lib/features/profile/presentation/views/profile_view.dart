import 'package:flutter/material.dart';
import 'package:ship/core/theme/app_color.dart';
import 'package:ship/features/profile/presentation/widgets/id_and_join_field.dart';
import 'package:ship/features/profile/presentation/widgets/nickname_field.dart';
import 'package:ship/features/profile/presentation/widgets/password_change_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final idController = TextEditingController(text: 'dlgustjd9566');
  final joinDateController = TextEditingController(text: '2025.09.09');
  final nickNameController = TextEditingController(text: '들뜬물개');

  final ScrollController _scrollController = ScrollController();
  final GlobalKey _passwordSectionKey = GlobalKey();
  bool isPasswordChangeVisible = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToPasswordSection() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Scrollable.ensureVisible(
        _passwordSectionKey.currentContext!,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      // final RenderBox? renderBox =
      //     _passwordSectionKey.currentContext?.findRenderObject() as RenderBox?;
      // if (renderBox != null) {
      //   final position = renderBox.localToGlobal(Offset.zero);
      //   final scrollOffset = _scrollController.offset + position.dy - 50;
      //   _scrollController.animateTo(
      //     scrollOffset,
      //     duration: Duration(milliseconds: 500),
      //     curve: Curves.easeInOut,
      //   );
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            IdAndJoinField(
              idController: idController,
              joinDateController: joinDateController,
            ),
            _divider(),
            SizedBox(height: 16),
            NicknameField(nickNameController: nickNameController),
            _divider(),
            SizedBox(height: 16),
            Container(
              key: _passwordSectionKey,
              child: Column(
                children: [
                  if (!isPasswordChangeVisible) _changePassword(),
                  if (isPasswordChangeVisible) PasswordChangeWidget(),
                ],
              ),
            ),
            SizedBox(height: 200), // 충분한 스크롤 여백 추가
          ],
        ),
      ),
    );
  }

  Widget _changePassword() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPasswordChangeVisible = true;
        });
        _scrollToPasswordSection();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: grey400, width: 1)),
        ),
        child: Text('비밀번호 변경', style: TextStyle(fontSize: 12, color: grey700)),
      ),
    );
  }

  Divider _divider() => Divider(color: grey400, thickness: 1);
}
