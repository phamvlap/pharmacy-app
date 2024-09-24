import 'package:flutter/material.dart';

import './../layouts/layouts.dart';
import './../components/components.dart';
import '../../utils/utils.dart';

class ConsultScreen extends StatelessWidget {
  const ConsultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: Text('Consult hereeeeee!!!'),
      drawer: MyAppDrawer(),
      bottomNavigationBar: AppNavigationBar(routeName: RouteNames.consult),
    );
  }
}
