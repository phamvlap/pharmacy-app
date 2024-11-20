import '../models/models.dart';
import './pocketbase_client.dart';
import './image_service.dart';
import '../utils/utils.dart';

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

  Future<List<OrderDetail>?> fetchAllOrderDetailsByOderId(
      String orderId, OrderStatus orderStatus) async {
    final List<OrderDetail> orderDetails = [];
    try {
      final pb = await getPocketBase();
      final imageService = ImageService();
      final orderDetailModels = await pb
          .collection('order_details')
          .getFullList(
              filter: 'status="${orderStatus.name}" && orderId="$orderId"');
      for (final orderDetailModel in orderDetailModels) {
        final ImageModel? image = await imageService.fetchImage(
          orderDetailModel.getStringValue('imageId'),
        );
        orderDetails.add(
          OrderDetail.fromJson(orderDetailModel.toJson()).copyWith(
            image: image,
          ),
        );
      }
      return orderDetails;
    } catch (error) {
      return null;
    }
  }
}
