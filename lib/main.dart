import 'package:flutter/material.dart';

import 'utils/app_theme.dart';
import 'ui/home_screen/home_screen.dart';

void main() {
  runApp(const DrugSalesApp());
}

class DrugSalesApp extends StatelessWidget {
  const DrugSalesApp({super.key});
  static const String _appName = 'Drug Sales App';

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.light();

    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(
        title: _appName,
      ),
    );
  }
}
