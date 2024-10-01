import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class RequireLoginDialog extends StatelessWidget {
  const RequireLoginDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Thông báo'),
      content: Container(
        alignment: Alignment.center,
        height: 80.0,
        child: const Text(
          'Vui lòng đăng nhập để xem được thông tin tài khoản',
          style: TextStyle(
            fontSize: AppFontSizes.textNormal,
          ),
        ),
      ),
      insetPadding: const EdgeInsets.all(10.0),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
            backgroundColor: AppColors.primaryColor.withOpacity(0.1),
            foregroundColor: AppColors.primaryColor,
            textStyle: const TextStyle(
              fontSize: AppFontSizes.textNormal,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 24.0,
            ),
          ),
          child: const Text('Trở lại'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(RouteNames.login);
          },
          style: TextButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.whiteColor,
            textStyle: const TextStyle(
              fontSize: AppFontSizes.textNormal,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 24.0,
            ),
          ),
          child: const Text('Đăng nhập'),
        ),
      ],
    );
  }
}
