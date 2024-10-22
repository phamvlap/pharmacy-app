import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:developer';

import '../components/components.dart';
import '../../utils/utils.dart';
import '../../controllers/controllers.dart';

import './home_badge_grid.dart';
import './home_diseases_grid.dart';
import './products_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> filterItemList = [
    {
      'text': 'Tất cả',
      'onPressed': () {
        log('filter button pressed');
      },
      'isActive': true,
    },
    {
      'text': 'Sản phẩm mới',
      'onPressed': () {
        log('filter button pressed');
      },
    },
    {
      'text': 'Vitamin tổng hợp',
      'onPressed': () {
        log('filter button pressed');
      },
    },
    {
      'text': 'Thực phẩm chức năng',
      'onPressed': () {
        log('filter button pressed');
      },
    },
  ];

  final List<Map<String, dynamic>> filterDiseaseList = [
    {
      'text': 'Tất cả',
      'onPressed': () {
        log('filter button pressed');
      },
      'isActive': true,
    },
    {
      'text': 'Theo lứa tuổi',
      'onPressed': () {
        log('filter button pressed');
      },
    },
    {
      'text': 'Theo đối tượng',
      'onPressed': () {
        log('filter button pressed');
      },
    },
  ];

  late Future<void> _fetchProducts;

  @override
  void initState() {
    super.initState();
    _fetchProducts = context.read<ProductController>().fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: FutureBuilder(
        future: _fetchProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              await context.read<ProductController>().fetchAllProducts();
            },
            child: Container(
              color: AppColors.mainBackgroundColor,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                children: [
                  HomeBadgeGrid(),
                  _buildSectionTitle(
                    iconData: Icons.manage_search,
                    title: 'GỢI Ý HÔM NAY',
                  ),
                  FilterButtonList(
                    filterList: filterItemList,
                  ),
                  const ProductsGrid(),
                  _buildSectionTitle(
                    iconData: Icons.add,
                    title: 'BỆNH',
                  ),
                  FilterButtonList(
                    filterList: filterDiseaseList,
                  ),
                  const HomeDiseasesGrid(),
                ],
              ),
            ),
          );
        },
      ),
      drawer: const MyAppDrawer(),
      bottomNavigationBar: const AppNavigationBar(routeName: RouteNames.home),
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
          decoration: const BoxDecoration(
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
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontSize: AppFontSizes.textMedium,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

class FilterButtonList extends StatelessWidget {
  final List<dynamic> filterList;

  const FilterButtonList({
    super.key,
    required this.filterList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filterList.length,
        itemBuilder: (context, index) {
          final dynamic filterItem = filterList[index];
          final List<Widget> returnedWidgets = [
            FilterTextButton(
              text: filterItem['text'],
              onPressed: filterItem['onPressed'],
              isActive: filterItem['isActive'] ?? false,
            ),
          ];
          if (index + 1 < filterList.length) {
            returnedWidgets.add(const SizedBox(width: 6.0));
          }
          return Row(children: returnedWidgets);
        },
      ),
    );
  }
}
