import 'package:flutter/material.dart';

class KeyboardCloseWrapperWidget extends StatelessWidget {
  final Widget child;
  const KeyboardCloseWrapperWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // キーボードが開いている場合はフォーカスを外す
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: child,
    );
  }
}
