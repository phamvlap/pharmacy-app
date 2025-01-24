import 'package:flutter/material.dart';

import 'dart:developer';

import '../components/components.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Expanded(
            child: AppSearchBar(),
          ),
          NotificationButton(
            onPressed: () {
              log('Notification button pressed');
            },
          ),
        ],
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
    this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      padding: const EdgeInsets.all(0.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
        ),
        child: const Icon(
          Icons.notifications,
        ),
      ),
    );
  }
}
