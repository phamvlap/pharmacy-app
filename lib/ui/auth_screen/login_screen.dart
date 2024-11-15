import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:developer';

import '../components/components.dart';
import '../components/dialogs/dialogs.dart';
import '../../controllers/controllers.dart';
import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _loginForm = GlobalKey<FormState>();
  final Map<String, String> _authData = {
    'username': '',
    'password': '',
  };

  Widget _buildUsernameField() {
    return AppTextFormField(
      icon: Icons.person,
      label: 'Tên đăng nhập',
      hintText: 'nguyenvana123',
      initialValue: 'minhnguyent546',
      validator: (value) => Validator.validateUsername(value!),
      autoFocus: true,
      onSaved: (value) {
        _authData['username'] = value!;
      },
    );
  }

  Widget _buildPasswordField() {
    return AppTextFormField(
      icon: Icons.lock,
      label: 'Mật khẩu',
      hintText: '',
      initialValue: '88888888',
      validator: (value) => Validator.validatePassword(value!),
      onSaved: (value) {
        _authData['password'] = value!;
      },
      hasSuffixIcon: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<void> fetchCartItems() async {
      await context.read<CartController>().fetchAllCartItems();
    }

    Future<void> submit() async {
      final isValid = _loginForm.currentState!.validate();
      if (!isValid) {
        return;
      }
      _loginForm.currentState!.save();
      try {
        await context
            .read<AuthController>()
            .login(_authData['username']!, _authData['password']!);
        await fetchCartItems();
      } catch (error) {
        log('Error submitting login form: $error');
        showErrorDialog(context, error.toString());
      }
    }

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
                    key: _loginForm,
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
                      submit();
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
                  // const AlternativeLoginOptions(),
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

class AlternativeLoginOptions extends StatelessWidget {
  const AlternativeLoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '--- Hoặc ---',
          style: TextStyle(
            fontSize: AppFontSizes.textSmall,
            color: Colors.grey[800],
          ),
          textAlign: TextAlign.center,
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
                height: 48.0,
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
                height: 48.0,
              ),
              label: const Text('Facebook'),
            ),
          ],
        ),
      ],
    );
  }
}
