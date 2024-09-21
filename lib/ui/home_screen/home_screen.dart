import 'package:flutter/material.dart';

import './../../utils/app_theme.dart';
import './../layouts/app_bar.dart';
import './../layouts/drawer.dart';
import './home_badge_grid.dart';
import './home_diseases_grid.dart';
import './products_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
        children: [
          HomeBadgeGrid(),
          _buildSectionTitle(
            iconData: Icons.manage_search,
            title: 'GỢI Ý HÔM NAY',
          ),
          const ProductsGrid(),
          _buildSectionTitle(
            iconData: Icons.add,
            title: 'BỆNH',
          ),
          const HomeDiseasesGrid(),
        ],
      ),
      drawer: const MyAppDrawer(),
    );
  }
}

Widget _buildSectionTitle({required IconData iconData, required String title}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          child: Icon(
            iconData,
            color: AppColors.whiteColor,
            size: AppFontSizes.textNormal,
          ),
        ),
        const SizedBox(width: 4.0),
        Text(
          title,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: AppFontSizes.textMedium,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
