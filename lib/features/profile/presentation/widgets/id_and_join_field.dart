import 'package:flutter/material.dart';
import 'package:ship/core/theme/app_color.dart';

class IdAndJoinField extends StatelessWidget {
  const IdAndJoinField({
    super.key,
    required this.idController,
    required this.joinDateController,
  });

  final TextEditingController idController;
  final TextEditingController joinDateController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _inputField(controller: idController, label: '아이디'),
        _inputField(
          controller: joinDateController,
          label: '가입일',
          readOnly: true,
        ),
      ],
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String label,
    bool readOnly = false,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 12, color: grey700)),
          SizedBox(
            height: 38,
            child: TextField(
              controller: controller,
              readOnly: readOnly,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
