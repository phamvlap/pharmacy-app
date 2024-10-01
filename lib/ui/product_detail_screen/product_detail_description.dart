import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../controllers/controllers.dart';
import '../../utils/utils.dart';

class ProductDetailDescription extends StatelessWidget {
  final Product product;
  final Map<String, String> showedFields;

  const ProductDetailDescription(
    this.product, {
    super.key,
    required this.showedFields,
  });

  @override
  Widget build(BuildContext context) {
    final ProductController productController = ProductController();

    final Map<String, dynamic> productMap = productController.toMap(product);

    List<Widget> productInfoDetail = showedFields.keys.map(
      (field) {
        if (productMap[field] != null) {
          return ProductDetailItemCard(
            title: showedFields[field]!,
            content: productMap[field],
          );
        }
        return const SizedBox.shrink();
      },
    ).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Thông tin sản phẩm',
          style: TextStyle(
            color: AppColors.greyColor,
            fontSize: AppFontSizes.textNormal,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4.0),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: productInfoDetail,
        ),
      ],
    );
  }
}

class ProductDetailItemCard extends StatelessWidget {
  final String title;
  final dynamic content;

  const ProductDetailItemCard({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    String contentText = '';

    if (content is String) {
      contentText = content;
    } else if (content is int) {
      contentText = content.toString();
    } else if (content is double) {
      contentText = content.toString();
    } else if (content is List<String>) {
      contentText = content.join(', ');
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 4.0),
          Text(
            title,
            style: TextStyle(
              color: AppColors.greyColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(contentText),
        ],
      ),
    );
  }
}
