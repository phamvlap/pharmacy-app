import 'package:flutter/material.dart';

import './utils/app_theme.dart';
import './ui/screen_renderer.dart';
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
      home: const ScreenRenderer(path: CartScreen.routeName),
      routes: {
        // HomeScreen.routeName: (context) =>
        //     ScreenRenderer(path: HomeScreen.routeName),
        ConsultScreen.routeName: (context) =>
            const ScreenRenderer(path: ConsultScreen.routeName),
        CartScreen.routeName: (context) =>
            const ScreenRenderer(path: CartScreen.routeName),
        UserScreen.routeName: (context) =>
            const ScreenRenderer(path: UserScreen.routeName),
      },
    );
  }
}
