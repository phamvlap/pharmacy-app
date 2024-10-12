import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class AppTextFormField extends StatefulWidget {
  final String? initialValue;
  final TextEditingController? controller;
  final IconData? icon;
  final String? label;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputAction? textInputAction;
  final bool? autoFocus;
  final TextInputType? keyboardType;
  final bool? hasSuffixIcon;
  final void Function()? onTap;

  const AppTextFormField({
    super.key,
    this.initialValue,
    this.controller,
    this.icon,
    this.label,
    this.hintText,
    this.validator,
    this.onSaved,
    this.textInputAction,
    this.autoFocus,
    this.keyboardType,
    this.hasSuffixIcon,
    this.onTap,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  final Map<String, dynamic> _formField = {};
  bool isVisibility = false;

  @override
  void initState() {
    _formField['controller'] = widget.controller;
    _formField['initialValue'] =
        (_formField['controller'] == null ? (widget.initialValue ?? '') : null);
    _formField['icon'] = widget.icon;
    _formField['label'] = widget.label ?? '';
    _formField['hintText'] = widget.hintText ?? '';
    _formField['validator'] = widget.validator ?? _defaultValidator;
    _formField['onSaved'] = widget.onSaved;
    _formField['textInputAction'] =
        widget.textInputAction ?? TextInputAction.next;
    _formField['autoFocus'] = widget.autoFocus ?? false;
    _formField['keyboardType'] = widget.keyboardType ?? TextInputType.text;
    _formField['hasSuffixIcon'] = widget.hasSuffixIcon ?? false;
    _formField['onTap'] = widget.onTap;
    super.initState();
  }

  String? _defaultValidator(String? value) {
    if (value!.isEmpty) {
      return 'Vui lòng nhập thông tin cho trường này';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        initialValue: _formField['initialValue'],
        controller: _formField['controller'],
        decoration: InputDecoration(
          icon: Icon(
            _formField['icon'],
            color: AppColors.primaryColor,
          ),
          floatingLabelStyle: const TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w300,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          label: Text(_formField['label']),
          labelStyle: const TextStyle(
            color: AppColors.primaryColor,
          ),
          hintText: _formField['hintText'],
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontWeight: FontWeight.w400,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.grey[400]!,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          suffixIcon: _formField['hasSuffixIcon']
              ? IconButton(
                  onPressed: () {
                    setState(
                      () {
                        isVisibility = !isVisibility;
                      },
                    );
                  },
                  icon: Icon(
                    isVisibility ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.greyColor,
                  ),
                )
              : null,
        ),
        validator: _formField['validator'],
        onSaved: _formField['onSaved'],
        textInputAction: _formField['textInputAction'],
        autofocus: _formField['autoFocus'] ?? false,
        keyboardType: _formField['keyboardType'],
        style: TextStyle(
          color: AppColors.greyColor,
          fontWeight: FontWeight.w400,
        ),
        obscureText: _formField['hasSuffixIcon'] ? !isVisibility : false,
        onTap: _formField['onTap'],
      ),
    );
  }
}
