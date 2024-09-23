import 'package:flutter/material.dart';

import './../layouts/app_bar.dart';
import './../layouts/drawer.dart';
import './../components/navigation_bar.dart';

class ConsultScreen extends StatelessWidget {
  const ConsultScreen({super.key});

  static const routeName = '/consult';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: Text('Consult hereeeeee!!!'),
      drawer: MyAppDrawer(),
      bottomNavigationBar: AppNavigationBar(routeName: routeName),
    );
  }
}
