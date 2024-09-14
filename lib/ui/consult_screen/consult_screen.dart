import 'package:flutter/material.dart';

import './../layouts/app_bar.dart';
import './../layouts/drawer.dart';

class ConsultScreen extends StatelessWidget {
  const ConsultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: Text('Consult hereeeeee!!!'),
      drawer: MyAppDrawer(),
    );
  }
}
