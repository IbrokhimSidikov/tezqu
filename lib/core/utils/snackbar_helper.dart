import 'package:flutter/material.dart';
import 'package:tezqu/core/constants/app_colors.dart';

enum SnackBarType { success, error, info }

void showAppSnackBar(
  BuildContext context,
  String message, {
  SnackBarType type = SnackBarType.info,
  Duration duration = const Duration(seconds: 3),
  SnackBarAction? action,
}) {
  final Color backgroundColor;
  final IconData icon;

  switch (type) {
    case SnackBarType.success:
      backgroundColor = const Color(0xFF43C19F);
      icon = Icons.check_circle_outline_rounded;
      break;
    case SnackBarType.error:
      backgroundColor = AppColors.cxF42800;
      icon = Icons.error_outline_rounded;
      break;
    case SnackBarType.info:
      backgroundColor = AppColors.cx292B2F;
      icon = Icons.info_outline_rounded;
      break;
  }

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        duration: duration,
        action: action,
        content: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SFCompact',
                ),
              ),
            ),
          ],
        ),
      ),
    );
}
