import 'package:flutter/material.dart';

import 'dart:developer';

import '../../models/models.dart';
import '../../utils/utils.dart';
import '../components/components.dart';

class ProductDetailBottomSheet extends StatefulWidget {
  final String buttonText;
  final Product product;
  final int? quantity;
  final Function()? onIncreaseQuantity;
  final Function()? onDecreaseQuantity;
  final Function()? onPressed;

  const ProductDetailBottomSheet({
    super.key,
    required this.buttonText,
    required this.product,
    this.quantity,
    this.onIncreaseQuantity,
    this.onDecreaseQuantity,
    this.onPressed,
  });

  @override
  State<ProductDetailBottomSheet> createState() =>
      _ProductDetailBottomSheetState();
}

class _ProductDetailBottomSheetState extends State<ProductDetailBottomSheet> {
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _quantity = widget.quantity ?? 1;
  }

  void _onIncreaseQuantity() {
    setState(
      () {
        _quantity++;
      },
    );
  }

  void _onDecreaseQuantity() {
    setState(
      () {
        _quantity = _quantity > 1 ? _quantity - 1 : 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ImageModel firstImage = widget.product.images.first;
    final double currentPrice =
        widget.product.price * (1.0 - (widget.product.salesOff));

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
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
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
                      Image.network(
                        firstImage.url,
                        width: 80.0,
                        height: 80.0,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.name,
                              style: TextStyle(
                                color: AppColors.greyColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              formatMoney(currentPrice),
                              style: const TextStyle(
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
                        quantity: _quantity,
                        onIncreaseQuantityPressed: () {
                          _onIncreaseQuantity();
                          widget.onIncreaseQuantity!();
                        },
                        onDecreaseQuantityPressed: () {
                          _onDecreaseQuantity();
                          widget.onDecreaseQuantity!();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AppTextButton(
            text: widget.buttonText,
            onPressed: () {
              widget.onPressed!();
            },
            minSize: const Size(double.infinity, 48.0),
            foregroundColor: AppColors.whiteColor,
            backgroundColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
