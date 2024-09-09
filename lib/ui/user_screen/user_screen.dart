import 'package:flutter/material.dart';

import '../layouts/app_bar.dart';
import '../layouts/bottom_navigation_bar.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: const Text('User hereeeeee!!!'),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
