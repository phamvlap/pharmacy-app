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
  final double maxDragPosition = -80.0;
  bool _isChecked = false;
  double _dragPosition = 0.0;

  void _onChanged(bool? value) {
    setState(
      () {
        _isChecked = value!;
      },
    );
  }

  double calculateSubTotal(CartItem cartItem) {
    final double subTotal =
        (cartItem.product.price * (1.0 - (cartItem.product.salesOff ?? 0.0))) *
            cartItem.quantity;
    return subTotal;
  }

  @override
  Widget build(BuildContext context) {
    final double subTotal = calculateSubTotal(widget.cartItem);

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(
          () {
            _dragPosition += details.delta.dx;
            if (_dragPosition < maxDragPosition) {
              _dragPosition = maxDragPosition;
            } else if (_dragPosition > 0) {
              _dragPosition = 0.0;
            }
          },
        );
      },
      onHorizontalDragEnd: (details) {
        setState(
          () {
            if (_dragPosition < maxDragPosition / 2) {
              _dragPosition = maxDragPosition;
            } else {
              _dragPosition = 0.0;
            }
          },
        );
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              width: double.infinity,
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  padding: const EdgeInsets.all(2.0),
                  onPressed: () {
                    log('delete item');
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.grey[100]!,
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(_dragPosition, 0),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.zero,
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
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: AppFontSizes.textSmall,
                            fontWeight: FontWeight.w500,
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
                              style: const TextStyle(
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
        ],
      ),
    );
  }
}
