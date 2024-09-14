import 'package:flutter/material.dart';

import 'utils/app_theme.dart';
import 'routes/main_route_screen.dart';

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
      home: const MainRouteScreen(),
    );
  }
}
