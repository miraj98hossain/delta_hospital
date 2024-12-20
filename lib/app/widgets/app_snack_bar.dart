import 'package:flutter/material.dart';

class AppSnackBar {
  static void showSnackBar({
    required BuildContext context,
    required String message,
    required SnackBarType type,
  }) {
    final snackBar = SnackBar(
      content: _buildContent(type, message),
      backgroundColor: _getBackgroundColor(type),
      behavior: SnackBarBehavior.floating,
      elevation: 5,
      dismissDirection: DismissDirection.horizontal,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Widget _buildContent(SnackBarType type, String message) {
    switch (type) {
      case SnackBarType.success:
        return Text(
          message,
          style: const TextStyle(color: Colors.white),
        );
      case SnackBarType.error:
        return Row(
          children: [
            const Icon(Icons.error, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      case SnackBarType.warning:
        return Row(
          children: [
            const Icon(Icons.warning, color: Colors.black),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
    }
  }

  static Color _getBackgroundColor(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return Colors.green;
      case SnackBarType.error:
        return Colors.red;
      case SnackBarType.warning:
        return Colors.yellow;
    }
  }
}

enum SnackBarType { success, error, warning }
