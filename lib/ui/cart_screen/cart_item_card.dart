import 'package:flutter/material.dart';

import 'dart:developer';

import '../../utils/utils.dart';
import '../../models/models.dart';
import '../components/components.dart';

class CartItemCard extends StatefulWidget {
  final CartItem cartItem;

  const CartItemCard(
    this.cartItem, {
    super.key,
  });

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  bool _isChecked = false;

  void _onChanged(bool? value) {
    setState(
      () {
        _isChecked = value!;
      },
    );
  }

  double calculateSubTotal() {
    final double subTotal = (widget.cartItem.product.price -
            (widget.cartItem.product.price *
                (widget.cartItem.product.salesOff ?? 0.0))) *
        widget.cartItem.quantity;
    return subTotal;
  }

  @override
  Widget build(BuildContext context) {
    final double subTotal = calculateSubTotal();

    return Dismissible(
      key: ValueKey(widget.cartItem.product.id),
      background: Container(
        width: 20.0,
        color: Colors.red,
        alignment: Alignment.centerLeft,
        child: const Icon(
          Icons.delete,
          color: AppColors.whiteColor,
        ),
      ),
      direction: DismissDirection.endToStart,
      dismissThresholds: const <DismissDirection, double>{
        DismissDirection.endToStart: 0.5,
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.greyColor.withOpacity(0.2),
                blurRadius: 4.0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AppCheckBox(
                value: _isChecked,
                onChanged: _onChanged,
              ),
              Image.asset(
                widget.cartItem.product.imageUrls[0],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.cartItem.product.name,
                      style: const TextStyle(
                        fontSize: AppFontSizes.textSmall,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatMoney(subTotal),
                          style: TextStyle(
                            fontSize: AppFontSizes.textNormal,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        QuantityUpdatingPannel(
                          quantity: widget.cartItem.quantity,
                          onDecreaseQuantityPressed: () {
                            setState(
                              () {
                                log('decrease');
                              },
                            );
                          },
                          onIncreaseQuantityPressed: () {
                            setState(
                              () {
                                log('increase');
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
