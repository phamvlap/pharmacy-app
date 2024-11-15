import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:developer';

import '../components/components.dart';
import '../../models/models.dart';
import '../../controllers/controllers.dart';
import '../../utils/utils.dart';

import './carousel_images_slider.dart';
import './product_detail_header.dart';
import './product_detail_description.dart';
import './product_detail_bottom_sheet.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen(
    this.product, {
    super.key,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;

  void _onIncreaseQuantity() {
    setState(
      () {
        _quantity++;
      },
    );
  }

  void _onDecreaseQuantity() {
    setState(
      () {
        _quantity = _quantity > 1 ? _quantity - 1 : 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<ImageModel> imageList = widget.product.images;
    final List<String> imageUrls = imageList.map((image) => image.url).toList();

    void onAddToCart() {
      context.read<CartController>().addCartItem(
            CartItem(
              name: widget.product.name,
              price: widget.product.price,
              productId: widget.product.id!,
              imageUrl: widget.product.images.first.url,
              quantity: _quantity,
              salesOff: widget.product.salesOff,
            ),
          );
    }

    void onBuyNow() {
      log('buy now');
    }

    void showAddToCartBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ProductDetailBottomSheet(
            buttonText: 'Thêm vào giỏ hàng',
            product: widget.product,
            quantity: _quantity,
            onIncreaseQuantity: _onIncreaseQuantity,
            onDecreaseQuantity: _onDecreaseQuantity,
            onPressed: onAddToCart,
          );
        },
      );
    }

    void showBuyNowBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ProductDetailBottomSheet(
            buttonText: 'Thêm vào giỏ hàng',
            product: widget.product,
            quantity: _quantity,
            onIncreaseQuantity: _onIncreaseQuantity,
            onDecreaseQuantity: _onDecreaseQuantity,
            onPressed: onBuyNow,
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Icon(Icons.share),
              ),
              onTap: () {
                log('share product');
              },
            ),
            GestureDetector(
              child: const Padding(
                padding: EdgeInsets.fromLTRB(8.0, 0.0, 20.0, 0.0),
                child: CartIcon(),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(RouteNames.cart);
              },
            ),
          ],
        ),
        body: Container(
          color: AppColors.mainBackgroundColor,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: <Widget>[
                    CarouselImagesSlider(imageUrls),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ProductDetailHeader(widget.product),
                          const SizedBox(height: 8.0),
                          ProductDetailDescription(
                            widget.product,
                            showedFields: const {
                              "description": "Mô tả",
                              "category": "Danh mục",
                              "producer": "Nhà sản xuất",
                              "components": "Thành phần",
                              "useGuide": "Hướng dẫn sử dụng",
                              "userTarget": "Đối tượng sử dụng",
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, -1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: AppTextButton(
                        text: 'Thêm vào giỏ hàng',
                        onPressed: () {
                          log('add to cart');
                          showAddToCartBottomSheet();
                        },
                        minSize: const Size(double.infinity, 48.0),
                        foregroundColor: AppColors.primaryColor,
                        backgroundColor: Colors.grey[200]!,
                      ),
                    ),
                    Expanded(
                      child: AppTextButton(
                        text: 'Mua ngay',
                        onPressed: () {
                          log('buy now');
                          showBuyNowBottomSheet();
                        },
                        minSize: const Size(double.infinity, 48.0),
                        foregroundColor: AppColors.whiteColor,
                        backgroundColor: AppColors.primaryColor,
                      ),
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
