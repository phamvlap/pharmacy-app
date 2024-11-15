import 'dart:developer';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

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

  void _submitOrder() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Process the order here, e.g. send to server
      log('Order placed:\n'
          'Name: $_data["name"]\n'
          'Address: $_data["address"]\n'
          'Phone Number: $_data["phoneNumber"]');
    }
  }

  @override
  Widget build(BuildContext context) {
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
          CheckoutSummary(onCheckoutSubmitted: _submitOrder),
        ],
      ),
    );
  }
}
