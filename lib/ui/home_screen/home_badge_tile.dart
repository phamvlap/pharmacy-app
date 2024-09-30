import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class HomeBadgeTile extends StatelessWidget {
  const HomeBadgeTile({
    required this.icon,
    required this.title,
    required this.onPressed,
    super.key,
  });

  final Icon icon;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 8.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        backgroundColor: const Color.fromARGB(255, 228, 225, 225),
      ),
      onPressed: onPressed,
      child: Column(
        children: <Widget>[
          icon,
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              fontSize: AppFontSizes.textSmall,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
