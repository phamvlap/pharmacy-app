import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';
import '../../models/models.dart';
import '../components/components.dart';
import '../../controllers/controllers.dart';

class CartItemCard extends StatefulWidget {
  final CartItem cartItem;
  final bool showCheckbox;
  final bool fixedQuantity;
  final bool uncheckOnRemove;

  const CartItemCard(
    this.cartItem, {
    super.key,
    this.showCheckbox = true,
    this.fixedQuantity = false,
    this.uncheckOnRemove = false,
  });

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  final double maxDragPosition = -80.0;
  double _dragPosition = 0.0;

  double calculateSubTotal(CartItem cartItem) {
    final double subTotal =
        (cartItem.price * (1.0 - (cartItem.salesOff))) * cartItem.quantity;
    return subTotal;
  }

  @override
  Widget build(BuildContext context) {
    final double subTotal = calculateSubTotal(widget.cartItem);

    void onIncreaseQuantity() {
      context.read<CartController>().addCartItem(
            widget.cartItem.copyWith(
              quantity: 1,
            ),
          );
    }

    void onDecreaseQuantity() {
      context.read<CartController>().removeCartItem(widget.cartItem.productId);
    }

    void onChangeSelection(bool? value) {
      context
          .read<CartController>()
          .toggleCartItemSelection(widget.cartItem.productId);
    }

    void onRemoveCartItem() {
      if (widget.uncheckOnRemove) {
        context
            .read<CartController>()
            .toggleCartItemSelection(widget.cartItem.productId);
      } else {
        context
            .read<CartController>()
            .deleteCartItem(widget.cartItem.productId);
      }
    }

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
                  onPressed: onRemoveCartItem,
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
                  if (widget.showCheckbox)
                    Consumer<CartController>(
                      builder: (context, cartController, child) {
                        return AppCheckBox(
                          value: cartController
                              .isSelected(widget.cartItem.productId),
                          onChanged: onChangeSelection,
                        );
                      },
                    ),
                  FittedBox(
                    child: widget.cartItem.featuredImage != null
                        ? Image.file(
                            widget.cartItem.featuredImage!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            widget.cartItem.imageUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.cartItem.name,
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
                            widget.fixedQuantity
                                ? Row(
                                    children: [
                                      Text(
                                        '${formatMoney(widget.cartItem.price)} x ${widget.cartItem.quantity} (-${(widget.cartItem.salesOff * 100).toInt()}%)',
                                      ),
                                    ],
                                  )
                                : Consumer<CartController>(
                                    builder: (context, cartController, child) {
                                      return QuantityUpdatingPannel(
                                        quantity: cartController
                                            .getQuantityByProductId(
                                                widget.cartItem.productId),
                                        onDecreaseQuantityPressed:
                                            onDecreaseQuantity,
                                        onIncreaseQuantityPressed:
                                            onIncreaseQuantity,
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
