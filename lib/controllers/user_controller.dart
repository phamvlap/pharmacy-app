import 'package:flutter/foundation.dart';

import '../../models/models.dart';
import '../../services/services.dart';

class UserController with ChangeNotifier {
  final UserService _userService = UserService();
  Future<void> updateUser(User user) async {
    final updatedUser = await _userService.updateUser(user);
    if (updatedUser != null) {
      notifyListeners();
    }
  }
}
