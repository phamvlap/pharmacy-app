import 'package:flutter/material.dart';

import '../layouts/app_bar.dart';
import '../layouts/bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: const Text('Body hereeeeee!!!'),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}