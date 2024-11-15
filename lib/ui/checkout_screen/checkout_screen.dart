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
  String _name = '';
  String _email = '';
  String _address = '';
  String _phoneNumber = '';

  void _submitOrder() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Process the order here, e.g. send to server
      log('Order placed:\n'
          'Name: $_name\n'
          'Email: $_email\n'
          'Address: $_address\n'
          'Phone Number: $_phoneNumber');
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
                    onSaved: (value) => _name = value!,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Vui lòng nhập email';
                      }
                      return null;
                    },
                    onSaved: (value) => _email = value!,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Địa chỉ'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Vui lòng nhập địa chỉ';
                      }
                      return null;
                    },
                    onSaved: (value) => _address = value!,
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
                    onSaved: (value) => _phoneNumber = value!,
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
            ),
          ),
          CheckoutSummary(onCheckoutSubmitted: _submitOrder),
        ],
      ),
    );
  }
}
