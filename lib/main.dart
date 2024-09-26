import 'package:flutter/material.dart';

import './utils/utils.dart';
import './ui/screens.dart';

void main() {
  runApp(const DrugSalesApp());
}

class DrugSalesApp extends StatelessWidget {
  const DrugSalesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.light();

    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const ScreenRenderer(),
      routes: {
        // HomeScreen.routeName: (context) =>
        //     ScreenRenderer(path: HomeScreen.routeName),
        RouteNames.consult: (context) =>
            const ScreenRenderer(path: RouteNames.consult),
        RouteNames.cart: (context) =>
            const ScreenRenderer(path: RouteNames.cart),
        RouteNames.profile: (context) =>
            const ScreenRenderer(path: RouteNames.profile),
        RouteNames.login: (context) =>
            const ScreenRenderer(path: RouteNames.login),
        RouteNames.register: (context) =>
            const ScreenRenderer(path: RouteNames.register),
      },
    );
  }
}
