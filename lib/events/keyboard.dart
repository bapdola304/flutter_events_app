import 'package:flutter/material.dart';

class KeyboardVisibilityObserver extends WidgetsBindingObserver {
  final VoidCallback onKeyboardShow;
  final VoidCallback onKeyboardHide;

  KeyboardVisibilityObserver(
      {required this.onKeyboardShow, required this.onKeyboardHide});

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    final keyboardVisible =
        // ignore: deprecated_member_use
        WidgetsBinding.instance.window.viewInsets.bottom > 0;
    if (keyboardVisible) {
      onKeyboardShow();
    } else {
      onKeyboardHide();
    }
  }
}
