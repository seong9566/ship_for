import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:ship/core/router/router_names.dart';
import 'package:ship/core/theme/app_color.dart';
import 'package:ship/core/utils/keyboard_action_util.dart';
import 'package:ship/features/widgets/custom_default_button.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController _idController;
  late TextEditingController _passwordController;
  final FocusNode _idFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _isRememberMe = false;

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: KeyboardActions(
          config: KeyboardActionUtil().buildConfig(context, [
            _idFocusNode,
            _passwordFocusNode,
          ]),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  _customInputField(
                    label: '아이디',
                    controller: _idController,
                    focusNode: _idFocusNode,
                    hintText: '아이디를 입력해주세요',
                  ),
                  SizedBox(height: 16),
                  _customInputField(
                    label: '비밀번호',
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    hintText: '비밀번호를 입력해주세요',
                  ),
                  _remember(),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomDefaultButton(
                      text: '로그인',
                      onPressed: () {
                        context.goNamed(RouterNames.HomePage);
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomDefaultButton(
                      text: '회원가입',
                      onPressed: () {
                        context.goNamed(RouterNames.SignPage);
                      },
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _remember() {
    return Row(
      children: [
        Checkbox(
          value: _isRememberMe,
          onChanged: (value) {
            setState(() {
              _isRememberMe = value!;
            });
          },
        ),
        Text(
          '로그인 유지하기',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _customInputField({
    String? hintText,
    required String label,
    required TextEditingController controller,
    required FocusNode focusNode,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: grey700,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
