import 'package:flutter/material.dart';

import 'dart:developer';

import '../../utils/utils.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({super.key});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.search,
              color: AppColors.greyColor,
              size: 24.0,
            ),
          ),
          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                log(_searchController.text);
                setState(() {});
              },
              onTapOutside: (PointerDownEvent even) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              decoration: InputDecoration(
                hintText: 'Tìm kiếm thuốc, dược phẩm...',
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: AppFontSizes.textExtraSmall,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                ),
              ),
              style: const TextStyle(
                color: AppColors.blackColor,
                fontSize: AppFontSizes.textSmall,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          _searchController.text.isNotEmpty
              ? Container(
                  height: 22.0,
                  width: 22.0,
                  margin: const EdgeInsets.only(right: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[500],
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      _searchController.clear();
                      setState(
                        () {},
                      );
                    },
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.whiteColor,
                      size: 20.0,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
