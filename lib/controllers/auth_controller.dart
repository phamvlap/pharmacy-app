import 'package:flutter/foundation.dart';

import '../models/models.dart';
import '../services/services.dart';

class AuthController with ChangeNotifier {
  User? _loggedInUser;
  late final AuthService _authService;

  AuthController() {
    _authService = AuthService(onAuthChange: onAuthChangeFn);
  }

  void onAuthChangeFn(User? user) {
    _loggedInUser = user;
    notifyListeners();
  }

  bool isLoggedIn() {
    return _loggedInUser != null;
  }

  User? get user {
    return _loggedInUser;
  }

  Future<User> register(
      String username, String password, String phoneNumber) async {
    return _authService.register(username, password, phoneNumber);
  }

  Future<User> login(String username, String password) async {
    return _authService.login(username, password);
  }

  Future<void> tryAutoLogin() async {
    final user = await _authService.getUserFromStore();
    if (user != null) {
      onAuthChangeFn(user);
    }
  }

  Future<void> logout() async {
    return _authService.logout();
  }
}
