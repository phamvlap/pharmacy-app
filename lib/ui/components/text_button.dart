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

class FilterTextButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final bool isActive;

  const FilterTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            ),
            shape: WidgetStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(30.0),
                ),
                side: BorderSide(
                  color:
                      isActive ? AppColors.primaryColor : AppColors.greyColor,
                ),
              ),
            ),
            backgroundColor: WidgetStateProperty.all<Color>(
              AppColors.whiteColor,
            ),
            foregroundColor: WidgetStateProperty.all<Color>(
              isActive ? AppColors.primaryColor : AppColors.greyColor,
            ),
          ),
          onPressed: onPressed,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: AppFontSizes.textExtraSmall,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  isActive
                      ? const Icon(
                          Icons.check_rounded,
                          color: AppColors.primaryColor,
                          size: AppFontSizes.textMedium,
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
