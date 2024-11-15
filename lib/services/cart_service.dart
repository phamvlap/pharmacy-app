import '../models/models.dart';
import './pocketbase_client.dart';
import './image_service.dart';

class CartService {
  Future<List<CartItem>> fetchAllCartItems() async {
    final List<CartItem> cartItems = [];
    final ImageService imageService = ImageService();

    try {
      final pb = await getPocketBase();
      final userId = pb.authStore.model!.id;
      final cartItemModels = await pb.collection('cart').getFullList(
            filter: "userId = '$userId'",
          );

      for (final cartItemModel in cartItemModels) {
        final ImageModel? image = await imageService.fetchImage(
          cartItemModel.getStringValue('imageId'),
        );
        cartItems.add(
          CartItem.fromJson(
            cartItemModel.toJson()
              ..addAll(
                {
                  'imageUrl': image?.url,
                  'featuredImage': image?.featuredImage,
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

      final cartItemModel = await pb.collection('cart').create(
        body: {
          ...cartItem.toJson(),
          'userId': userId,
        },
      );

      return cartItem.copyWith(
        id: cartItemModel.id,
      );
    } catch (error) {
      return null;
    }
  }

  Future<CartItem?> updateCartItem(CartItem cartItem) async {
    try {
      final pb = await getPocketBase();
      final ImageService imageService = ImageService();
      final userId = pb.authStore.model!.id;

      await pb.collection('cart').update(
        cartItem.id!,
        body: {
          ...cartItem.toJson(),
          'userId': userId,
        },
      );

      final ImageModel? image =
          await imageService.fetchImage(cartItem.imageId!);

      return cartItem.copyWith(
        imageUrl: image?.url,
        featuredImage: image?.featuredImage,
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
