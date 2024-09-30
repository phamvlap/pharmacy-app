import 'package:flutter/material.dart';

import 'dart:developer';

import '../components/components.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';

import './carousel_images_slider.dart';
import './product_detail_header.dart';
import './product_detail_description.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: CartIcon(),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(RouteNames.cart);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                CarouselImagesSlider(product.imageUrls),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProductDetailHeader(product),
                      const SizedBox(height: 8.0),
                      ProductDetailDescription(
                        product,
                        showedFields: const {
                          "description": "Mô tả",
                          "category": "Danh mục",
                          "producer": "Nhà sản xuất",
                          "components": "Thành phần",
                          "useGuide": "Hướng dẫn sử dụng",
                          "userTarget": "Đối tượng sử dụng",
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
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
                        Colors.grey[200]!,
                      ),
                      foregroundColor: WidgetStateProperty.all<Color>(
                        AppColors.primaryColor,
                      ),
                    ),
                    onPressed: () {
                      log('add to cart');
                    },
                    child: const Text(
                      'Thêm vào giỏ hàng',
                      style: TextStyle(
                        fontSize: AppFontSizes.textMedium,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
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
                        AppColors.primaryColor,
                      ),
                      foregroundColor: WidgetStateProperty.all<Color>(
                        AppColors.whiteColor,
                      ),
                    ),
                    onPressed: () {
                      log('buy now');
                    },
                    child: const Text(
                      'Mua ngay',
                      style: TextStyle(
                        fontSize: AppFontSizes.textMedium,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
