import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

void showAlertDialog(
  BuildContext context, {
  required String message,
  required int duration,
  void Function()? dismissFunction,
  Widget? alertActionButton,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: Container(
          width: 260,
          height: 100,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color.fromARGB(120, 0, 0, 0),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 0.5,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: AppFontSizes.textExtraSmall,
                  color: AppColors.whiteColor,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                ),
              ),
              alertActionButton != null
                  ? const SizedBox(height: 4)
                  : const SizedBox(),
              alertActionButton ?? const SizedBox(),
            ],
          ),
        ),
      );
    },
  );

  Future.delayed(
    Duration(seconds: duration),
    () => {
      dismissFunction!(),
    },
  );
}

class AlertActionButton extends StatelessWidget {
  const AlertActionButton({
    super.key,
    required this.actionText,
    this.onPressed,
  });

  final String actionText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          actionText,
          style: const TextStyle(
            fontSize: AppFontSizes.textExtraSmall,
          ),
        ),
      ),
    );
  }
}
