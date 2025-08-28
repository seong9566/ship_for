import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class KeyboardActionUtil {
  KeyboardActionsConfig buildConfig(
    BuildContext context,
    List<FocusNode> focusNodes,
  ) {
    return KeyboardActionsConfig(
      keyboardBarElevation: 1,
      keyboardBarColor: Colors.white,
      defaultDoneWidget: Text(
        '닫기',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      actions: focusNodes
          .map(
            (focusNode) => KeyboardActionsItem(
              focusNode: focusNode,
              displayArrows: false,
              displayDoneButton: true,
            ),
          )
          .toList(),
    );
  }
}
