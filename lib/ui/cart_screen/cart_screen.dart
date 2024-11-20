import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/controllers.dart';
import '../../utils/utils.dart';
import '../components/components.dart';

import './cart_item_list.dart';
import './cart_summary.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Future<void> _fetchCartItems;

  @override
  void initState() {
    super.initState();
    _fetchCartItems = context.read<CartController>().fetchAllCartItems();
  }

  @override
  Widget build(BuildContext context) {
    final CartController cartController = context.watch<CartController>();
    int itemCount = cartController.itemCount;

    void closeAlertDialog() {
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ hàng ($itemCount)'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _fetchCartItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () => context.read<CartController>().fetchAllCartItems(),
            child: Container(
              color: AppColors.mainBackgroundColor,
              child: itemCount == 0
                  ? const EmptyCart(
                      title: Text('Giỏ hàng trống'),
                    )
                  : Column(
                      children: <Widget>[
                        Expanded(
                          child: CartItemList(
                            closeAlertDialog: closeAlertDialog,
                          ),
                        ),
                        CartSummary(
                          closeAlertDialog: closeAlertDialog,
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
