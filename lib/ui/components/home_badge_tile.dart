import 'package:flutter/material.dart';

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
    return SizedBox(
      width: 120,
      height: 120,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            shadowColor: Colors.transparent,
          ),
          child: Column(
            children: <Widget>[
              icon,
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
