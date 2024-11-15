import './pocketbase_client.dart';
import '../models/models.dart';
import '../utils/utils.dart';
import './image_service.dart';

class OrderDetailService {
  Future<OrderDetail?> addOrderDetail(OrderDetail orderDetail) async {
    try {
      final pb = await getPocketBase();

      final orderDetailModel = await pb.collection('order_details').create(
        body: {
          ...orderDetail.toJson(),
        },
      );

      final imageService = ImageService();
      ImageModel image = orderDetail.image!;
      final uploadedImage = await imageService.uploadImage(
        image.copyWith(
          refId: orderDetailModel.id,
          type: ImageType.product.name,
        ),
      );

      return orderDetail.copyWith(
        id: orderDetailModel.id,
        image: uploadedImage,
      );
    } catch (error) {
      return null;
    }
  }
}
