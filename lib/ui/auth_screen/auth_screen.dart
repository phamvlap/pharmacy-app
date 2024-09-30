import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/controllers.dart';

import '../../utils/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Consts.appName),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Đăng nhập',
              style: TextStyle(
                fontSize: AppFontSizes.textExtraLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            const LoginTextField(
              label: Text('Tên đăng nhập'),
              icon: Icon(Icons.person),
              hintText: 'Ví dụ: nguyenvana123',
            ),
            const SizedBox(height: 16.0),
            const LoginTextField(
              label: Text('Mật khẩu'),
              hintText: 'Nhập mật khẩu',
              icon: Icon(Icons.lock),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                log('Logging in...');
                log(context.read<AuthManager>().isLoggedIn().toString());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.whiteColor,
                minimumSize: const Size.fromHeight(40.0),
              ),
              child: const Text('Đăng nhập'),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Chưa có tài khoản?'),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RouteNames.register);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  child: const Text('Đăng ký'),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    log('Going to register screen...');
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  child: const Text('Quên mật khẩu?'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              '--- Hoặc ---',
              style: TextStyle(
                fontSize: AppFontSizes.textSmall,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ThirdPartyLoginButton(
                  onPressed: () {
                    log('Going to login with google...');
                  },
                  logo: Image.asset(
                    'assets/logos/google.png',
                    width: 24.0,
                    height: 24.0,
                  ),
                  label: const Text('Google'),
                ),
                ThirdPartyLoginButton(
                  onPressed: () {
                    log('Going to login with facebook...');
                  },
                  logo: Image.asset(
                    'assets/logos/facebook.png',
                    width: 24.0,
                    height: 24.0,
                  ),
                  label: const Text('Facebook'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Consts.appName),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Đăng ký',
              style: TextStyle(
                fontSize: AppFontSizes.textExtraLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            const LoginTextField(
              label: Text('Tên đăng nhập'),
              icon: Icon(Icons.person),
              hintText: 'Ví dụ: nguyenvana123',
            ),
            const SizedBox(height: 16.0),
            const LoginTextField(
              label: Text('Số điện thoại'),
              icon: Icon(Icons.phone),
              hintText: 'Ví dụ: nguyenvana123',
            ),
            const SizedBox(height: 16.0),
            const LoginTextField(
              label: Text('Mật khẩu'),
              hintText: 'Nhập mật khẩu',
              icon: Icon(Icons.lock),
            ),
            const SizedBox(height: 16.0),
            const LoginTextField(
              label: Text('Nhập lại mật khẩu'),
              hintText: 'Nhập mật khẩu',
              icon: Icon(Icons.lock),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                log('Logging in...');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.whiteColor,
                minimumSize: const Size.fromHeight(40.0),
              ),
              child: const Text('Đăng ký'),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Đã có tài khoản?'),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RouteNames.login);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  child: const Text('Đăng nhập'),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginTextField extends StatelessWidget {
  final Widget label;
  final Widget? icon;
  final String? hintText;

  const LoginTextField({
    super.key,
    required this.label,
    this.icon,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        icon: icon,
        floatingLabelStyle: TextStyle(
          color: Colors.grey[500],
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        label: label,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[400],
        ),
      ),
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}

class ThirdPartyLoginButton extends StatelessWidget {
  final Widget logo;
  final Widget label;
  final void Function()? onPressed;

  const ThirdPartyLoginButton({
    super.key,
    required this.logo,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(170.0, 40.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: BorderSide(color: Colors.grey[300]!),
        ),
        foregroundColor: AppColors.greyColor,
      ),
      child: Row(
        children: [
          logo,
          const SizedBox(width: 8.0),
          label,
        ],
      ),
    );
  }
}
