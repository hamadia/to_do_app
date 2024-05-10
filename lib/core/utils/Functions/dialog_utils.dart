import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoadingDialog(
    BuildContext context,
    String message,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircularProgressIndicator(),
            Text(message),
          ],
        ),
      ),
    );
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
    context,
    String message, {
    bool isDismissible = true,
    String? posActionTitle,
    String? negActionTitle,
    VoidCallback? posAction,
    VoidCallback? negAction,
  }) {
    List<Widget> actions = [];
    if (posActionTitle != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posActionTitle),
        ),
      );
    }
    if (negActionTitle != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionTitle),
        ),
      );
    }
    showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
        actions: actions,
      ),
    );
  }
}
