import 'package:flutter/foundation.dart';

class AuthController with ChangeNotifier {
  bool _isLoggedIn = true;

  bool isLoggedIn() {
    return _isLoggedIn;
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }
}
