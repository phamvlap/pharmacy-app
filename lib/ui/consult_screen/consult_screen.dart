import 'package:flutter/material.dart';

import '../layouts/app_bar.dart';
import '../layouts/bottom_navigation_bar.dart';

class ConsultScreen extends StatelessWidget {
  const ConsultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: const Text('Consult hereeeeee!!!'),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
