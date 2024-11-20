import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../components/dialogs/dialogs.dart';
import '../../utils/utils.dart';
import '../../controllers/controllers.dart';

import './checkout_summary.dart';
import '../cart_screen/cart_item_list.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _data = {
    'name': '',
    'address': '',
    'phoneNumber': '',
  };

  void goToPendingOrdersScreen() {
    Navigator.of(context)
        .pushReplacementNamed(RouteNames.myOrderDetail, arguments: 0);
  }

  @override
  Widget build(BuildContext context) {
    final CartController cartController = context.read<CartController>();

    void submitOrder() {
      final isValid = _formKey.currentState!.validate();
      if (!isValid) {
        return;
      }

      _formKey.currentState!.save();

      context.read<OrderController>().addOrder(
            userInformation: _data,
            cartItems: cartController.selectedCartItems,
            userId: context.read<AuthController>().user!.id!,
            discount: cartController.discountAmount,
            total: cartController.totalAmount,
            shippingFee: cartController.shippingFee,
          );
      context.read<CartController>().removeSelectedCartItems();

      showAlertDialog(
        context,
        message: 'Đặt hàng thành công',
        duration: 2,
        dismissFunction: goToPendingOrdersScreen,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Đặt hàng'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Xác nhận thông tin đặt hàng',
              style: TextStyle(
                  fontSize: AppFontSizes.textMedium,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    initialValue: 'Lap',
                    decoration: const InputDecoration(labelText: 'Họ tên'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Vui lòng nhập họ và tên';
                      }
                      return null;
                    },
                    onSaved: (value) => _data["name"] = value!,
                  ),
                  TextFormField(
                    initialValue: 'An Giang',
                    decoration:
                        const InputDecoration(labelText: 'Địa chỉ giao hàng'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Vui lòng nhập địa chỉ giao hàng';
                      }
                      return null;
                    },
                    onSaved: (value) => _data["address"] = value!,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Số điện thoại'),
                    initialValue: '0374283372',
                    validator: (value) {
                      if (value!.isEmpty || value.length != 10) {
                        return 'Số điện thoại không hợp lệ';
                      }
                      return null;
                    },
                    onSaved: (value) => _data["phoneNumber"] = value!,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              'Sảm phẩm',
              style: TextStyle(
                  fontSize: AppFontSizes.textMedium,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Expanded(
            child: CartItemList(
              selectedOnly: true,
              showCartItemCheckbox: false,
              fixedQuantity: true,
              unCheckItemOnRemove: true,
            ),
          ),
          CheckoutSummary(onCheckoutSubmitted: submitOrder),
        ],
      ),
    );
  }
}
