import 'package:http/http.dart' as http;
import 'package:pocketbase/pocketbase.dart';

import '../models/models.dart';
import './pocketbase_client.dart';

class CartService {
  String _getFeaturedImageUrl(PocketBase pb, RecordModel cartItemModel) {
    final featuredImageName = cartItemModel.getStringValue('featuredImage');
    return pb.files.getUrl(cartItemModel, featuredImageName).toString();
  }

  Future<List<CartItem>> fetchAllCartItems() async {
    final List<CartItem> cartItems = [];

    try {
      final pb = await getPocketBase();
      final userId = pb.authStore.model!.id;
      final cartItemModels = await pb.collection('cart').getFullList(
            filter: "userId = '$userId'",
          );

      for (final cartItemModel in cartItemModels) {
        cartItems.add(
          CartItem.fromJson(
            cartItemModel.toJson()
              ..addAll(
                {
                  'imageUrl': _getFeaturedImageUrl(pb, cartItemModel),
                },
              ),
          ),
        );
      }

      return cartItems;
    } catch (error) {
      return [];
    }
  }

  Future<CartItem?> addCartItem(CartItem cartItem) async {
    try {
      final pb = await getPocketBase();
      final userId = pb.authStore.model!.id;
      final String imageUrl = cartItem.imageUrl;

      final response = await http.get(Uri.parse(imageUrl));
      final featuredImageBytes = response.bodyBytes;

      final cartItemModel = await pb.collection('cart').create(
        body: {
          ...cartItem.toJson(),
          'userId': userId,
        },
        files: [
          http.MultipartFile.fromBytes(
            'featuredImage',
            featuredImageBytes,
            filename: imageUrl.split('/').last,
          ),
        ],
      );

      return cartItem.copyWith(
        id: cartItemModel.id,
        imageUrl: _getFeaturedImageUrl(pb, cartItemModel),
      );
    } catch (error) {
      return null;
    }
  }

  Future<CartItem?> updateCartItem(CartItem cartItem) async {
    try {
      final pb = await getPocketBase();
      final userId = pb.authStore.model!.id;
      final String imageUrl = cartItem.imageUrl;

      final response = await http.get(Uri.parse(imageUrl));
      final featuredImageBytes = response.bodyBytes;

      final cartItemModel = await pb.collection('cart').update(
        cartItem.id!,
        body: {
          ...cartItem.toJson(),
          'userId': userId,
        },
        files: [
          http.MultipartFile.fromBytes(
            'featuredImage',
            featuredImageBytes,
            filename: imageUrl.split('/').last,
          ),
        ],
      );

      return cartItem.copyWith(
        imageUrl: _getFeaturedImageUrl(pb, cartItemModel),
      );
    } catch (error) {
      return null;
    }
  }

  Future<bool> clearCartItem(String? id) async {
    if (id == null) {
      return false;
    }
    try {
      final pb = await getPocketBase();
      await pb.collection('cart').delete(id);
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> clearAllCartItems() async {
    try {
      final pb = await getPocketBase();
      final userId = pb.authStore.model!.id;

      final cartItemModels =
          await pb.collection('cart').getFullList(filter: "userId = '$userId'");

      for (final cartItemModel in cartItemModels) {
        await pb.collection('cart').delete(cartItemModel.id);
      }

      return true;
    } catch (error) {
      return false;
    }
  }
}
