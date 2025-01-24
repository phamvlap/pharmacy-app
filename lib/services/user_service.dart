import '../services/services.dart';
import '../models/models.dart';

class UserService {
  Future<User?> updateUser(User user) async {
    final pb = await getPocketBase();
    try {
      final userModel = await pb.collection('users').update(
            user.id!,
            body: user.toJson(),
          );
      return user.copyWith(
        id: userModel.id,
      );
    } catch (error) {
      return null;
    }
  }
}
