import 'package:flutter/material.dart';

import './../../utils/app_theme.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.search,
              color: AppColors.greyColor,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm thuốc, dược phẩm...',
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: AppFontSizes.textExtraSmall,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
