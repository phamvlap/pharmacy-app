import 'package:flutter/foundation.dart';

class AuthManager with ChangeNotifier {
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
