import 'package:flutter/material.dart';

import '../screens.dart';
import '../components/components.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    super.key,
    required this.routeName,
  });

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: ScreenRenderer.pathToIndex(routeName),
      onDestinationSelected: (index) {
        Navigator.of(context).pushReplacementNamed(
          ScreenRenderer.indexToPath(index),
        );
      },
      destinations: [
        const NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Trang chủ',
        ),
        const NavigationDestination(
          icon: Icon(Icons.chat),
          label: 'Tư vấn',
        ),
        NavigationDestination(
          icon: CartIcon(),
          label: 'Giỏ hàng',
        ),
        const NavigationDestination(
          icon: Icon(Icons.person),
          label: 'Tài khoản',
        ),
      ],
    );
  }
}
