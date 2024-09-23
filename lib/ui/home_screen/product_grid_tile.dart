import 'package:flutter/material.dart';

import './../../utils/utils.dart';
import './../../models/models.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile(
    this.product, {
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.greyColor,
            spreadRadius: 0.5,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                height: 120.0,
                product.imageUrls[0],
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 4.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                width: double.infinity,
                child: Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: AppFontSizes.textSmall,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: 4.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          '${product.price.toString()}đ',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: AppFontSizes.textNormal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text('/'),
                        ),
                        Text(
                          product.unit,
                        ),
                      ],
                    ),
                    const SizedBox(width: 8.0),
                    if (product.salesOff != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4.0,
                          vertical: 2.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: AppColors.greyColor.withOpacity(0.7),
                        ),
                        child: Text(
                          '-${(product.salesOff! * 100).toInt()}%',
                          style: TextStyle(
                            fontSize: 11.0,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 4.0),
            ],
          ),
          BuyNowButton(
            onPressed: () {
              print('Mua ngay');
            },
          ),
        ],
      ),
    );
  }
}

class BuyNowButton extends StatelessWidget {
  const BuyNowButton({
    super.key,
    this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          AppColors.primaryColor,
        ),
        minimumSize: WidgetStateProperty.all<Size>(
          const Size(160.0, 44.0),
        ),
      ),
      child: const Text(
        'Mua ngay',
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: AppFontSizes.textMedium,
        ),
      ),
    );
  }
}
