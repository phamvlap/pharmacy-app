import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class UserInformationScreen extends StatelessWidget {
  const UserInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin cá nhân'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          bottom: 40.0,
          left: 16.0,
          right: 16.0,
        ),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/default_avatar.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20.0),
            const UserInformationRecord(
                title: 'Họ và tên', content: 'Nguyễn Văn Test'),
            Divider(color: Colors.grey[200]),
            const UserInformationRecord(
                title: 'Số điện thoại', content: '0364235462'),
            Divider(color: Colors.grey[200]),
            const UserInformationRecord(title: 'Ngày sinh'),
            Divider(color: Colors.grey[200]),
            const UserInformationRecord(title: 'Giới tính'),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteNames.editUserInformation);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.whiteColor,
                backgroundColor: AppColors.primaryColor,
                minimumSize: const Size(double.infinity, 44),
              ),
              child: const Text(
                'Chỉnh sửa thông tin',
                style: TextStyle(fontSize: AppFontSizes.textNormal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserInformationRecord extends StatelessWidget {
  final String title;
  final String? content;

  const UserInformationRecord({
    super.key,
    required this.title,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: AppFontSizes.textNormal),
          ),
          content != null
              ? Text(
                  content!,
                  style: const TextStyle(fontSize: AppFontSizes.textNormal),
                )
              : TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteNames
                        .editUserInformation); // TODO: specify element to autofocus
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(0.0),
                    overlayColor: Colors.transparent,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Bổ sung thông tin',
                    style: TextStyle(fontSize: AppFontSizes.textNormal),
                  ),
                ),
        ],
      ),
    );
  }
}