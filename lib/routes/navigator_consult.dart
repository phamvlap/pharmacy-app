import 'package:flutter/material.dart';

import '../ui/consult_screen/consult_screen.dart';

class NavigatorConsult extends StatelessWidget {
  const NavigatorConsult({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return const ConsultScreen();
          },
        );
      },
    );
  }
}
