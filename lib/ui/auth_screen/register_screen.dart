import 'dart:developer';
import 'package:provider/provider.dart';

import 'package:ct484_project/ui/components/dialogs/dialogs.dart';
import 'package:flutter/material.dart';

import '../components/components.dart';
import '../../controllers/controllers.dart';
import '../../utils/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _registerForm = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final Map<String, String> _authData = {
    'username': '',
    'name': '',
    'phoneNumber': '',
    'password': '',
  };

  @override
  void initState() {
    super.initState();
    _passwordController.text = '12345678';
  }

  Future<void> _submit() async {
    final isValid = _registerForm.currentState!.validate();
    if (!isValid) {
      return;
    }
    _registerForm.currentState!.save();
    try {
      await context.read<AuthController>().register(
          _authData['username']!,
          _authData['name']!,
          _authData['password']!,
          _authData['phoneNumber']!);
      Navigator.of(context).pushReplacementNamed(RouteNames.login);
    } catch (error) {
      log('Error submitting register form: $error');
      if (mounted) {
        showErrorDialog(context, error.toString());
      }
    }
  }

  Widget _buildUsernameField() {
    return AppTextFormField(
      icon: Icons.person,
      initialValue: 'test42',
      label: 'Tên đăng nhập',
      hintText: 'nguyenvana123',
      validator: (value) => Validator.validateUsername(value!),
      autoFocus: true,
      onSaved: (value) {
        _authData['username'] = value!;
      },
    );
  }

  Widget _buildNameField() {
    return AppTextFormField(
      icon: Icons.person,
      initialValue: 'Phạm Văn Lặp',
      label: 'Họ và tên',
      hintText: 'Nguyễn Văn A',
      validator: (value) => Validator.validateName(value!),
      autoFocus: true,
      onSaved: (value) {
        _authData['name'] = value!;
      },
    );
  }

  Widget _buildPhoneNumberField() {
    return AppTextFormField(
      icon: Icons.phone,
      initialValue: '0364253427',
      label: 'Số điện thoại',
      hintText: '',
      validator: (value) => Validator.validatePhoneNumber(value!),
      keyboardType: TextInputType.phone,
      onSaved: (value) {
        _authData['phoneNumber'] = value!;
      },
    );
  }

  Widget _buildPasswordField() {
    return AppTextFormField(
      controller: _passwordController,
      icon: Icons.lock,
      label: 'Mật khẩu',
      hintText: '',
      validator: (value) => Validator.validatePassword(value!),
      onSaved: (value) {
        _authData['password'] = value!;
      },
      hasSuffixIcon: true,
    );
  }

  Widget _buildConfirmPasswordField() {
    return AppTextFormField(
      icon: Icons.lock,
      initialValue: '12345678',
      label: 'Nhập lại mật khẩu',
      hintText: '',
      validator: (value) => Validator.validateConfirmPassword(
        _passwordController.text,
        value!,
      ),
      hasSuffixIcon: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng ký'),
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
        alignment: Alignment.center,
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
                    key: _registerForm,
                    child: Column(
                      children: [
                        _buildUsernameField(),
                        _buildNameField(),
                        _buildPhoneNumberField(),
                        _buildPasswordField(),
                        _buildConfirmPasswordField(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.whiteColor,
                      minimumSize: const Size.fromHeight(40.0),
                    ),
                    child: const Text('Đăng ký'),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                          ),
                        ),
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
