import 'package:flutter/material.dart';

import './../../models/models.dart';
import './../components/components.dart';
import './../../utils/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _registerForm = GlobalKey<FormState>();
  late User _user;

  @override
  void initState() {
    _user = User(
      id: '',
      username: '',
      phoneNumber: '',
      password: '',
      gender: '',
      dateOfBirth: '',
    );
    super.initState();
  }

  String? _validateUsername(String? value) {
    if (value!.isEmpty) {
      return 'Vui lòng nhập tên đăng nhập';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value!.isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }
    if (value.length < 10 || value.length > 11) {
      return 'Số điện thoại có độ dài từ 10 đến 11 số';
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

  String? _validateConfirmPassword(String? value) {
    if (value!.isEmpty) {
      return 'Vui lòng nhập lại mật khẩu';
    }
    if (value.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 ký tự';
    }
    if (value != _user.password) {
      return 'Mật khẩu không khớp';
    }
    return null;
  }

  Future<void> _saveForm() async {
    final isValid = _registerForm.currentState!.validate();
    if (!isValid) {
      return;
    }
  }

  Widget _buildUsernameField() {
    return AppTextFormField(
      initialValue: _user.username,
      icon: Icons.person,
      label: 'Tên đăng nhập',
      hintText: 'nguyenvana123',
      validator: (value) => _validateUsername(value!),
      autoFocus: true,
      onSaved: (value) {
        _user = _user.copyWith(username: value);
      },
    );
  }

  Widget _buildPhoneNumberField() {
    return AppTextFormField(
      initialValue: _user.phoneNumber,
      icon: Icons.phone,
      label: 'Số điện thoại',
      hintText: '',
      validator: (value) => _validatePhoneNumber(value!),
      keyboardType: TextInputType.phone,
      onSaved: (value) {
        _user = _user.copyWith(phoneNumber: value);
      },
    );
  }

  Widget _buildPasswordField() {
    return AppTextFormField(
      initialValue: _user.password,
      icon: Icons.lock,
      label: 'Mật khẩu',
      hintText: '',
      validator: (value) => _validatePassword(value!),
      onSaved: (value) {
        _user = _user.copyWith(password: value);
      },
      hasSuffixIcon: true,
    );
  }

  Widget _buildConfirmPasswordField() {
    return AppTextFormField(
      initialValue: _user.password,
      icon: Icons.lock,
      label: 'Nhập lại mật khẩu',
      hintText: '',
      validator: (value) => _validateConfirmPassword(value!),
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
                        _buildPhoneNumberField(),
                        _buildPasswordField(),
                        _buildConfirmPasswordField(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _saveForm,
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
