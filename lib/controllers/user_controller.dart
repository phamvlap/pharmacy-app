import 'dart:developer';

import 'package:flutter/material.dart';

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
