import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';

class ProductDetailHeader extends StatelessWidget {
  final Product product;

  const ProductDetailHeader(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double originalPrice = product.price;
    final double newPrice = originalPrice * (1.0 - (product.salesOff ?? 0.0));

    return Column(
      children: [
        Row(
          children: [
            const Text('Thương hiệu:'),
            const SizedBox(width: 4.0),
            Text(
              product.brand,
              style: TextStyle(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        SizedBox(
          width: double.infinity,
          child: Text(
            product.name,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: AppFontSizes.textMedium,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(height: 4.0),
        IntrinsicHeight(
          child: Row(
            children: [
              Text(
                formatMoney(newPrice),
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: AppFontSizes.textLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    '/',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                    ),
                    textDirection: TextDirection.values[0],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    product.unit,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.5),
                  child: Text(
                    formatMoney(originalPrice),
                    style: TextStyle(
                      color: AppColors.greyColor,
                      fontSize: AppFontSizes.textNormal,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColors.greyColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
