import 'package:flutter/material.dart';
import 'package:ship/core/theme/app_color.dart';

class NicknameField extends StatefulWidget {
  const NicknameField({super.key, required this.nickNameController});

  final TextEditingController nickNameController;

  @override
  State<NicknameField> createState() => _NicknameFieldState();
}

class _NicknameFieldState extends State<NicknameField> {
  final FocusNode nickNameFocusNode = FocusNode();
  bool isEditing = false;
  String originalNickname = '';

  @override
  void initState() {
    super.initState();
    originalNickname = widget.nickNameController.text;
  }

  void onClickChangeButton() {
    setState(() {
      isEditing = true;
      originalNickname = widget.nickNameController.text;
    });
    nickNameFocusNode.requestFocus();
  }

  void onClickCancelButton() {
    setState(() {
      widget.nickNameController.text = originalNickname;
      isEditing = false;
    });
  }

  void onClickCompleteButton() {
    setState(() {
      isEditing = false;
    });
    // TODO: 닉네임 변경 API 호출 또는 콜백 함수 호출
  }

  void onClickTextField() {
    if (!isEditing) {
      // setState(() {
      //   isEditing = true;
      //   originalNickname = widget.nickNameController.text;
      // });
      nickNameFocusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_titleAndButton(), SizedBox(height: 4), _inputField()],
    );
  }

  SizedBox _inputField() {
    return SizedBox(
      child: TextField(
        onTap: () => onClickTextField(),
        controller: widget.nickNameController,
        focusNode: nickNameFocusNode,
        enableInteractiveSelection: false,
        readOnly: !isEditing,
        decoration: InputDecoration(
          border: isEditing
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: grey500, width: 0.5),
                )
              : InputBorder.none,
          focusedBorder: isEditing
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: grey500, width: 0.5),
                )
              : InputBorder.none,
          enabledBorder: isEditing
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: grey500, width: 0.5),
                )
              : InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.only(
            left: isEditing ? 16 : 0,
            right: 16,
            top: 8,
            bottom: 8,
          ),
        ),
      ),
    );
  }

  Row _titleAndButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('닉네임', style: TextStyle(fontSize: 12, color: grey700)),
        if (!isEditing)
          GestureDetector(
            onTap: () {
              onClickChangeButton();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: grey500,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '변경하기',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
          )
        else
          Row(
            children: [
              _cancelAndConfirmButton(
                onClickCompleteButton,
                '완료',
                greenConfirmColor,
              ),
              SizedBox(width: 8),
              _cancelAndConfirmButton(
                onClickCancelButton,
                '취소',
                redCancelColor,
              ),
            ],
          ),
      ],
    );
  }

  Widget _cancelAndConfirmButton(VoidCallback onTap, String text, Color color) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
