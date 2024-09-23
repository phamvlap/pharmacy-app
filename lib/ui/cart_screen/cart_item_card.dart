import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../../models/models.dart';

class CartItemCard extends StatefulWidget {
  final CartItem cartItem;

  const CartItemCard(this.cartItem, {super.key});

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<WidgetState> states) {
      const Set<WidgetState> interactiveStates = <WidgetState>{
        WidgetState.pressed,
        WidgetState.hovered,
        WidgetState.focused,
        WidgetState.selected,
      };
      if (states.any(interactiveStates.contains)) {
        return AppColors.primaryColor;
      }
      return AppColors.whiteColor;
    }

    final double subTotal = (widget.cartItem.product.price -
            (widget.cartItem.product.price *
                (widget.cartItem.product.salesOff ?? 0.0))) *
        widget.cartItem.quantity;

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
          padding: const EdgeInsets.all(8.0),
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
              Checkbox(
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(
                    () {
                      _isChecked = value!;
                    },
                  );
                },
                checkColor: AppColors.whiteColor,
                fillColor: WidgetStateProperty.resolveWith(getColor),
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
                        fontSize: AppFontSizes.textNormal,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${subTotal.toStringAsFixed(0)}đ',
                          style: const TextStyle(
                            fontSize: AppFontSizes.textNormal,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey[600]!,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 24.0,
                                height: 24.0,
                                child: Center(
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0.0),
                                    icon: const Icon(Icons.remove),
                                    iconSize: 12.0,
                                    onPressed: () {
                                      print('remove');
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Colors.grey[400]!,
                                    ),
                                    right: BorderSide(
                                      color: Colors.grey[400]!,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  widget.cartItem.quantity.toString(),
                                  style: const TextStyle(
                                    fontSize: AppFontSizes.textNormal,
                                  ),
                                ),
                              ),
                              Container(
                                width: 24.0,
                                height: 24.0,
                                child: Center(
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0.0),
                                    alignment: Alignment.center,
                                    icon: const Icon(Icons.add),
                                    iconSize: 12.0,
                                    onPressed: () {
                                      print('add');
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
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
