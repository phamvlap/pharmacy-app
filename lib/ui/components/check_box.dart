import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class AppCheckBox extends StatefulWidget {
  final bool value;
  final Function(bool?) onChanged;

  const AppCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
      WidgetState.selected,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColors.primaryColor;
    }
    return AppColors.whiteColor;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.value,
      onChanged: widget.onChanged,
      checkColor: AppColors.whiteColor,
      fillColor: WidgetStateProperty.resolveWith(getColor),
      side: BorderSide(
        color: AppColors.greyColor,
        width: 1.0,
      ),
    );
  }
}
