import 'package:flutter/material.dart';
import 'package:ship/core/theme/app_color.dart';

class PasswordChangeWidget extends StatefulWidget {
  const PasswordChangeWidget({super.key});

  @override
  State<PasswordChangeWidget> createState() => _PasswordChangeWidgetState();
}

class _PasswordChangeWidgetState extends State<PasswordChangeWidget>
    with SingleTickerProviderStateMixin {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0.0, -0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    // 위젯이 생성되면 애니메이션 시작
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '비밀번호 변경',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 24),
            _buildPasswordField(
              controller: currentPasswordController,
              label: '비밀번호',
              hintText: '기존 비밀번호',
            ),
            SizedBox(height: 16),
            _buildPasswordField(
              controller: newPasswordController,
              label: '비밀번호 변경',
              hintText: '변경할 비밀번호',
            ),
            SizedBox(height: 16),
            _buildPasswordField(
              controller: confirmPasswordController,
              label: '비밀번호 확인',
              hintText: '비밀번호 확인',
            ),
            SizedBox(height: 32),
            _buildCompleteButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: grey300, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: controller,
            obscureText: true,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14, color: grey500),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCompleteButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // TODO: 비밀번호 변경 API 호출
          debugPrint('비밀번호 변경 완료');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          '변경 완료',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
