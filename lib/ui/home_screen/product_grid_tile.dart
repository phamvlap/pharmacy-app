import 'package:flutter/material.dart';

import 'dart:developer';

import '../../utils/utils.dart';
import '../../models/models.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile(
    this.product, {
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final double currentPrice =
        product.price * (1.0 - (product.salesOff ?? 0.0));

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 0.1,
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
              GestureDetector(
                child: Image.asset(
                  height: 120.0,
                  product.imageUrls[0],
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    RouteNames.productDetail,
                    arguments: product.id,
                  );
                },
              ),
              const SizedBox(height: 4.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                width: double.infinity,
                child: Text(
                  product.name,
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: AppFontSizes.textSmall,
                    fontWeight: FontWeight.w500,
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
                          formatMoney(currentPrice),
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: AppFontSizes.textNormal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            '/',
                            style: TextStyle(
                              color: AppColors.greyColor,
                            ),
                          ),
                        ),
                        Text(
                          product.unit,
                          style: TextStyle(
                            color: AppColors.greyColor,
                          ),
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
                          color: Colors.grey[300],
                        ),
                        child: Text(
                          '-${(product.salesOff! * 100).toInt()}%',
                          style: const TextStyle(
                            fontSize: AppFontSizes.textExtraSmall,
                            color: AppColors.primaryColor,
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
              log('Mua ngay');
            },
          ),
        ],
      ),
    );
  }
}

class BuyNowButton extends StatelessWidget {
  final void Function()? onPressed;

  const BuyNowButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          AppColors.primaryColor,
        ),
        minimumSize: WidgetStateProperty.all<Size>(
          const Size(140.0, 36.0),
        ),
      ),
      child: const Text(
        'Mua ngay',
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: AppFontSizes.textNormal,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
