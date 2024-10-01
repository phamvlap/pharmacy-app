import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class AppTextButton extends StatelessWidget {
  final Size? minSize;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final void Function() onPressed;
  final String text;

  const AppTextButton({
    super.key,
    this.minSize,
    this.backgroundColor,
    this.foregroundColor,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all<Size>(
          minSize ?? const Size(double.infinity, 48.0),
        ),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(12.0),
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide.none,
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          backgroundColor ?? AppColors.primaryColor,
        ),
        foregroundColor: WidgetStateProperty.all<Color>(
          foregroundColor ?? AppColors.whiteColor,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: AppFontSizes.textMedium,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
