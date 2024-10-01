import 'package:flutter/material.dart';

import 'dart:developer';

import '../components/components.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';

void itemQuantityChangingBottomSheet(context, {required Product product}) {
  final double currentPrice = product.price * (1.0 - (product.salesOff ?? 0.0));

  showModalBottomSheet(
    context: context,
    builder: (BuildContext builderContext) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.zero,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 4.0, 4.0, 0),
                        width: 40.0,
                        child: IconButton(
                          padding: const EdgeInsets.all(0.0),
                          style: ButtonStyle(
                            padding:
                                WidgetStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.all(0.0),
                            ),
                            shape: WidgetStateProperty.all<OutlinedBorder>(
                              const CircleBorder(
                                side: BorderSide.none,
                              ),
                            ),
                            backgroundColor: WidgetStateProperty.all<Color>(
                              Colors.grey[200]!,
                            ),
                          ),
                          icon: Icon(
                            Icons.close,
                            color: Colors.grey[700],
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          width: 80.0,
                          height: 80.0,
                          product.imageUrls[0],
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(
                                  color: AppColors.greyColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                formatMoney(currentPrice),
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0.6,
                    color: Colors.grey[300],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Số lượng:',
                            style: TextStyle(
                              color: AppColors.greyColor,
                              fontSize: AppFontSizes.textNormal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        QuantityUpdatingPannel(
                          quantity: 1,
                          onIncreaseQuantityPressed: () {
                            log('increase quantity');
                          },
                          onDecreaseQuantityPressed: () {
                            log('decrease quantity');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppTextButton(
              text: 'Chọn mua',
              onPressed: () {
                log('buy');
              },
              minSize: const Size(double.infinity, 48.0),
              foregroundColor: AppColors.whiteColor,
              backgroundColor: AppColors.primaryColor,
            ),
          ],
        ),
      );
    },
  );
}
