import 'package:flutter/material.dart';

import '../ui/home_screen/home_screen.dart';

class NavigatorHome extends StatelessWidget {
  const NavigatorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );
      },
    );
  }
}
