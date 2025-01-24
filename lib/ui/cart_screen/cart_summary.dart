import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';
import '../../controllers/controllers.dart';
import '../components/components.dart';
import '../components/dialogs/dialogs.dart';

class CartSummary extends StatefulWidget {
  final void Function()? closeAlertDialog;

  const CartSummary({
    super.key,
    this.closeAlertDialog,
  });

  @override
  State<CartSummary> createState() => _CartSummaryState();
}

class _CartSummaryState extends State<CartSummary> {
  bool _expanded = false;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = context.watch<CartController>();

    final double totalAmount = cartController.totalAmount;
    final double discountAmount = cartController.discountAmount;
    final double shippingFee =
        cartController.selectedItemCount > 0 ? cartController.shippingFee : 0;
    final double finalAmount = totalAmount + shippingFee - discountAmount;

    _isChecked = cartController.isSelectingAllItems();

    void onSelectAllItems(bool? value) {
      cartController.toggleSelectedAllCartItems(value!);
      setState(
        () {
          _isChecked = value;
        },
      );
    }

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
              AppCheckBox(
                value: _isChecked,
                onChanged: onSelectAllItems,
              ),
              Text('Tất cả', style: TextStyle(color: Colors.grey[600])),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                  bottom: 8.0,
                ),
                child: TextButton(
                  onPressed: () {
                    if (cartController.selectedItemCount > 0) {
                      Navigator.of(context).pushNamed(RouteNames.checkout);
                    } else {
                      showAlertDialog(
                        context,
                        message: 'Vui lòng chọn sản phẩm trước khi mua hàng',
                        duration: 2,
                        dismissFunction: widget.closeAlertDialog,
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.whiteColor,
                    backgroundColor: AppColors.primaryColor,
                  ),
                  child: Text('Mua hàng (${cartController.selectedItemCount})'),
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
