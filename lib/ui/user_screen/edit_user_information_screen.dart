import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

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
                    // fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Họ và tên',
                    ),
                    controller: _nameController,
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Số điện thoại',
                    ),
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,
                  ),
                  const SizedBox(height: 10.0),
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
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Ngày sinh',
                    ),
                    controller: _dobController,
                    onTap: () async {
                      // FocusScope.of(context).requestFocus(FocusNode());
                      log('Showing date picker');
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
                  ),
                  const SizedBox(height: 10.0),
                  const Spacer(),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                log('Updating user information');
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
