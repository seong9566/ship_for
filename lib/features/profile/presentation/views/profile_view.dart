import 'package:flutter/material.dart';
import 'package:ship/core/theme/app_color.dart';
import 'package:ship/features/profile/presentation/widgets/id_and_join_field.dart';
import 'package:ship/features/profile/presentation/widgets/nickname_field.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final idController = TextEditingController(text: 'dlgustjd9566');
  final joinDateController = TextEditingController(text: '2025.09.09');
  final nickNameController = TextEditingController(text: '들뜬물개');

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          _changePassword(),
        ],
      ),
    );
  }

  Widget _changePassword() {
    return GestureDetector(
      onTap: () {},
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
