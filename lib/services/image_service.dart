import 'package:http/http.dart' as http;
import 'package:pocketbase/pocketbase.dart';

import './pocketbase_client.dart';
import '../models/image_model.dart';

class ImageService {
  String _getFeaturedImageUrl(PocketBase pb, RecordModel productModel) {
    final featuredImageName = productModel.getStringValue('featuredImage');
    return pb.files.getUrl(productModel, featuredImageName).toString();
  }

  Future<ImageModel?> uploadImage(ImageModel image) async {
    try {
      final pb = await getPocketBase();
      final uploadedImageModel = await pb.collection('images').create(
        body: {
          ...image.toJson(),
        },
        files: [
          http.MultipartFile.fromBytes(
            'featuredImage',
            image.featuredImage!.readAsBytesSync(),
            filename: image.featuredImage!.path.split('/').last,
          ),
        ],
      );

      return image.copyWith(
        id: uploadedImageModel.id,
        url: _getFeaturedImageUrl(pb, uploadedImageModel),
      );
    } catch (error) {
      return null;
    }
  }

  Future<ImageModel?> fetchImage(String id) async {
    try {
      final pb = await getPocketBase();
      final imageModel = await pb.collection('images').getOne(id);

      return ImageModel.fromJson(
        imageModel.toJson()
          ..addAll(
            {
              'url': _getFeaturedImageUrl(pb, imageModel),
            },
          ),
      );
    } catch (error) {
      return null;
    }
  }

  Future<List<ImageModel>?> fetchImageByRef(String refId, String type) async {
    try {
      final pb = await getPocketBase();

      final imageModels = await pb.collection('images').getFullList(
            filter: "refId = '$refId'",
          );

      final List<ImageModel> images = [];

      for (final imageModel in imageModels) {
        images.add(
          ImageModel.fromJson(
            imageModel.toJson()
              ..addAll(
                {
                  'url': _getFeaturedImageUrl(pb, imageModel),
                },
              ),
          ),
        );
      }

      return images;
    } catch (error) {
      return null;
    }
  }

  Future<bool> deleteImage(String id) async {
    try {
      final pb = await getPocketBase();
      await pb.collection('images').delete(id);

      return true;
    } catch (error) {
      return false;
    }
  }
}
