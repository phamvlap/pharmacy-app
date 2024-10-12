import 'dart:developer';

class Validator {
  static String? validateUsername(String? value) {
    if (value!.isEmpty) {
      return 'Vui lòng nhập tên đăng nhập';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    if (value.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 ký tự';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value!.isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }
    if (value.length < 10 || value.length > 11) {
      return 'Số điện thoại có độ dài từ 10 đến 11 số';
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? password,
    String? confirmedPassword,
  ) {
    log('password: $password!');
    log('confirmedPassword: $confirmedPassword!');

    if (password!.isEmpty) {
      return 'Vui lòng nhập lại mật khẩu';
    }
    if (password.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 ký tự';
    }
    if (password != confirmedPassword) {
      return 'Mật khẩu không khớp';
    }
    return null;
  }
}
