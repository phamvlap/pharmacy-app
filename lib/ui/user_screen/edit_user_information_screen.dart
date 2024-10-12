import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../components/components.dart';
import '../../utils/utils.dart';
import '../../models/models.dart';

class EditUserInformationScreen extends StatefulWidget {
  const EditUserInformationScreen({super.key});

  @override
  State<EditUserInformationScreen> createState() =>
      _EditUserInformationScreenState();
}

class _EditUserInformationScreenState extends State<EditUserInformationScreen> {
  String _selectedGender = 'nam';
  DateTime _selectedDate = DateTime.now();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  late User _user;
  final GlobalKey<FormState> _userInformationForm = GlobalKey<FormState>();

  @override
  void initState() {
    _user = User(
      id: '',
      username: '',
      phoneNumber: '',
      password: '',
      gender: '',
      // dateOfBirth: DateTime(2003, 1, 1),
      dateOfBirth: DateFormat('yyyy-MM-dd').format(DateTime(2003, 1, 1)),
    );
    _dobController.text = _user.dateOfBirth as String;
    super.initState();
  }

  Widget _buildUsernameField() {
    return AppTextFormField(
      initialValue: _user.username,
      icon: Icons.person,
      label: 'Tên đăng nhập',
      hintText: 'nguyenvana123',
      validator: (value) => Validator.validateUsername(value!),
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
      validator: (value) => Validator.validatePhoneNumber(value!),
      keyboardType: TextInputType.phone,
      onSaved: (value) {
        _user = _user.copyWith(phoneNumber: value);
      },
    );
  }

  Widget _buildDateOfBirthField() {
    return AppTextFormField(
      // initialValue: _user.dateOfBirth,
      icon: Icons.calendar_today,
      label: 'Ngày sinh',
      hintText: '',
      onSaved: (value) {
        _user = _user.copyWith(dateOfBirth: value);
      },
      controller: _dobController,
      onTap: () async {
        await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2015),
          lastDate: DateTime(2025),
        ).then((selectedDate) {
          if (selectedDate != null) {
            setState(() {
              _selectedDate = selectedDate;
              _dobController.text =
                  DateFormat('dd/MM/yyyy').format(selectedDate);
            });
          }
        });
      },
    );
  }

  Future<void> _saveForm() async {
    final isValid = _userInformationForm.currentState!.validate();
    if (!isValid) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cập nhật thông tin'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          bottom: 40.0,
          left: 16.0,
          right: 16.0,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  Image.asset(
                    'assets/default_avatar.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  Form(
                    key: _userInformationForm,
                    child: Column(
                      children: [
                        const SizedBox(height: 20.0),
                        _buildUsernameField(),
                        const SizedBox(height: 10.0),
                        _buildPhoneNumberField(),
                        const SizedBox(height: 10.0),
                        _buildDateOfBirthField(),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Giới tính',
                          style: TextStyle(fontSize: AppFontSizes.textNormal)),
                      Row(
                        children: <Widget>[
                          Row(
                            children: [
                              Radio(
                                value: 'nam',
                                groupValue: _selectedGender,
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedGender = value!;
                                  });
                                },
                              ),
                              const Text('Nam'),
                            ],
                          ),
                          const SizedBox(width: 20.0),
                          Row(
                            children: [
                              Radio(
                                value: 'nữ',
                                groupValue: _selectedGender,
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedGender = value!;
                                  });
                                },
                              ),
                              const Text('Nữ'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _saveForm();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.whiteColor,
                backgroundColor: AppColors.primaryColor,
                minimumSize: const Size(double.infinity, 44),
              ),
              child: const Text(
                'Cập nhật',
                style: TextStyle(fontSize: AppFontSizes.textNormal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
