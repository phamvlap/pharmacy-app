import 'package:flutter/material.dart';

import './../layouts/app_bar.dart';
import './../layouts/drawer.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: Text('User hereeeeee!!!'),
      drawer: MyAppDrawer(),
    );
  }
}
