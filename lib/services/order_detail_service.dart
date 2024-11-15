import '../models/models.dart';
import './pocketbase_client.dart';
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
      final ImageModel? image = await imageService.fetchImage(
        orderDetailModel.getStringValue('imageId'),
      );

      return orderDetail.copyWith(
        id: orderDetailModel.id,
        image: image,
      );
    } catch (error) {
      return null;
    }
  }
}
