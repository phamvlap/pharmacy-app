import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:developer';

import '../../utils/utils.dart';
import '../../controllers/controllers.dart';

class CheckoutSummary extends StatefulWidget {
  void Function() onCheckoutSubmitted;

  CheckoutSummary({super.key, required this.onCheckoutSubmitted});

  @override
  State<CheckoutSummary> createState() => _CheckoutSummaryState();
}

class _CheckoutSummaryState extends State<CheckoutSummary> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final cartController = context.read<CartController>();

    final double totalAmount = cartController.totalAmount;
    final double discountAmount = cartController.discountAmount;
    const double shippingFee = 0.0;
    final double finalAmount = totalAmount + shippingFee - discountAmount;

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                if (_expanded)
                  CartSummaryDetail(
                    totalAmount: totalAmount,
                    discountAmount: discountAmount,
                    shippingFee: shippingFee,
                  ),
                const SizedBox(height: 8.0),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Thành tiền',
                      style: TextStyle(
                        fontSize: AppFontSizes.textNormal,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      formatMoney(finalAmount),
                      style: const TextStyle(
                        fontSize: AppFontSizes.textMedium,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0.0),
                      width: 30.0,
                      height: 30.0,
                      child: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        // iconSize: 20.0,
                        color: Colors.grey[600],
                        icon: Icon(
                          _expanded ? Icons.expand_more : Icons.expand_less,
                        ),
                        onPressed: () {
                          setState(() {
                            _expanded = !_expanded;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[200],
          ),
          Row(
            children: <Widget>[
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                  bottom: 8.0,
                ),
                child: TextButton(
                  onPressed: () {
                    widget.onCheckoutSubmitted();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.whiteColor,
                    backgroundColor: AppColors.primaryColor,
                  ),
                  child: Text('Đặt hàng (${cartController.selectedItemCount})'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CartSummaryDetail extends StatelessWidget {
  final double totalAmount;
  final double discountAmount;
  final double shippingFee;

  const CartSummaryDetail({
    super.key,
    required this.totalAmount,
    required this.discountAmount,
    required this.shippingFee,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 8.0,
        right: 12.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Tổng tiền'),
              Text(
                formatMoney(totalAmount),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Giảm giá'),
              Text(
                '-${formatMoney(discountAmount)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Phí vận chuyển'),
              Text(
                formatMoney(shippingFee),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
