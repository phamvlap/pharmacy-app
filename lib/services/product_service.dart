import './pocketbase_client.dart';
import './image_service.dart';
import '../models/models.dart';
import '../utils/utils.dart';

class ProductService {
  Future<Product?> addProduct(Product product) async {
    try {
      final pb = await getPocketBase();
      final imageService = ImageService();

      final productModel = await pb.collection('products').create(
        body: {
          ...product.toJson(),
        },
      );

      final List<ImageModel> featuredImages = product.featuredImages;
      final List<ImageModel> uploadedImages = [];

      for (final image in featuredImages) {
        final uploadedImage = await imageService.uploadImage(
          image.copyWith(
            refId: productModel.id,
            type: ImageType.product.name,
          ),
        );

        if (uploadedImage != null) {
          uploadedImages.add(uploadedImage);
        }
      }

      return product.copyWith(
        id: productModel.id,
        images: uploadedImages,
      );
    } catch (error) {
      return null;
    }
  }

  Future<Product?> updateProduct(Product product) async {
    try {
      final pb = await getPocketBase();
      final imageService = ImageService();

      final productModel = await pb.collection('products').update(
        product.id!,
        body: {
          ...product.toJson(),
        },
      );

      final List<ImageModel> featuredImages = product.featuredImages;
      final List<ImageModel> uploadedImages = [];

      for (final image in featuredImages) {
        final uploadedImage = await imageService.uploadImage(
          image.copyWith(
            refId: productModel.id,
            type: ImageType.product.name,
          ),
        );

        if (uploadedImage != null) {
          uploadedImages.add(uploadedImage);
        }
      }

      return product.copyWith(
        images: uploadedImages,
      );
    } catch (error) {
      return null;
    }
  }

  Future<List<Product>?> fetchAllProducts() async {
    final List<Product> products = [];
    try {
      final pb = await getPocketBase();
      final imageService = ImageService();
      final productModels = await pb.collection('products').getFullList();

      for (final productModel in productModels) {
        final List<ImageModel>? images = await imageService.fetchImageByRef(
          productModel.id,
          ImageType.product.name,
        );

        products.add(
          Product.fromJson(productModel.toJson()).copyWith(
            images: images ?? [],
          ),
        );
      }

      return products;
    } catch (error) {
      return null;
    }
  }

  Future<Product?> fetchProductById(String id) async {
    try {
      final pb = await getPocketBase();
      final imageService = ImageService();
      final productModel = await pb.collection('products').getOne(id);

      final List<ImageModel>? images = await imageService.fetchImageByRef(
        productModel.id,
        ImageType.product.name,
      );

      return Product.fromJson(
        productModel.toJson(),
      ).copyWith(
        images: images ?? [],
      );
    } catch (error) {
      return null;
    }
  }

  Future<bool> deleteProduct(String id) async {
    try {
      final pb = await getPocketBase();
      final imageService = ImageService();

      final List<ImageModel>? images =
          await imageService.fetchImageByRef(id, ImageType.product.name);

      if (images != null) {
        for (final image in images) {
          await imageService.deleteImage(image.id!);
        }
      }
      await pb.collection('products').delete(id);

      return true;
    } catch (error) {
      return false;
    }
  }
}
