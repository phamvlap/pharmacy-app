import 'package:flutter/material.dart';

import './../layouts/app_bar.dart';
import './../layouts/drawer.dart';
import './../components/navigation_bar.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: Text('User hereeeeee!!!'),
      drawer: MyAppDrawer(),
      bottomNavigationBar: AppNavigationBar(routeName: routeName),
    );
  }
}
