import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class MyAppDrawer extends StatelessWidget {
  const MyAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          top: 40.0,
          bottom: 0.0,
          left: 20.0,
          right: 20.0,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.secondaryColor,
                    width: 1.0,
                  ),
                ),
              ),
              child: Text(
                Consts.appName,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: AppFontSizes.displayMedium,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0.0),
                children: [
                  ListTile(
                    leading: const Icon(Icons.home, size: 28.0),
                    title: const Text('Home'),
                    iconColor: AppColors.greyColor,
                    textColor: AppColors.greyColor,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    titleTextStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home, size: 28.0),
                    title: const Text('Home'),
                    iconColor: AppColors.greyColor,
                    textColor: AppColors.greyColor,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    titleTextStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home, size: 28.0),
                    title: const Text('Home'),
                    iconColor: AppColors.greyColor,
                    textColor: AppColors.greyColor,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    titleTextStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Text('Version 1.0'),
          ],
        ),
      ),
    );
  }
}
