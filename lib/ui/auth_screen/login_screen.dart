import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:developer';

import './../components/components.dart';
import './../../models/models.dart';
import './../../controllers/controllers.dart';
import './../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _loginForm = GlobalKey<FormState>();

  late User? _user;

  @override
  void initState() {
    _user = User(
      id: '',
      username: '',
      phoneNumber: '',
      password: '',
    );
    super.initState();
  }

  String? _validateUsername(String? value) {
    if (value!.isEmpty) {
      return 'Vui lòng nhập tên đăng nhập';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    if (value.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 ký tự';
    }
    return null;
  }

  Widget _buildUsernameField() {
    return AppTextFormField(
      initialValue: _user!.username,
      icon: Icons.person,
      label: 'Tên đăng nhập',
      hintText: 'nguyenvana123',
      validator: (value) => _validateUsername(value!),
      autoFocus: true,
      onSaved: (value) {
        _user = _user!.copyWith(username: value);
      },
    );
  }

  Widget _buildPasswordField() {
    return AppTextFormField(
      initialValue: _user!.password,
      icon: Icons.lock,
      label: 'Mật khẩu',
      hintText: '',
      validator: (value) => _validatePassword(value!),
      onSaved: (value) {
        _user = _user!.copyWith(password: value);
      },
      hasSuffixIcon: true,
    );
  }

  Future<void> _saveForm() async {
    final isValid = _loginForm.currentState!.validate();
    if (!isValid) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng nhập'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: AppColors.mainBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 24.0),
            Expanded(
              child: ListView(
                children: [
                  Form(
                    child: Column(
                      children: [
                        _buildUsernameField(),
                        _buildPasswordField(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      _saveForm();
                      log(context
                          .read<AuthController>()
                          .isLoggedIn()
                          .toString());
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
                        child: const Text(
                          'Đăng ký',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                          ),
                        ),
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
                        child: const Text(
                          'Quên mật khẩu?',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                          ),
                        ),
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
          ],
        ),
      ),
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
