import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens.dart';
import '../../controllers/controllers.dart';
import '../../utils/utils.dart';
import '../components/dialogs/dialogs.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key, required this.routeName});

  final String routeName;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = CartController();
    final int itemCount = cartController.itemCount;

    return NavigationBar(
      selectedIndex: ScreenRenderer.pathToIndex(routeName),
      onDestinationSelected: (index) {
        String path = ScreenRenderer.indexToPath(index);
        if (path == RouteNames.profile) {
          bool isLoggedIn = context.read<AuthController>().isLoggedIn();
          if (!isLoggedIn) {
            showDialog(
              context: context,
              builder: (BuildContext context) => const RequireLoginDialog(),
            );
            return;
          }
        }
        Navigator.of(context).pushReplacementNamed(path);
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
          icon: (itemCount > 0)
              ? Badge(
                  label: Text(
                    cartController.itemCount.toString(),
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  textColor: Colors.white,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: const Icon(Icons.shopping_cart),
                )
              : const Icon(Icons.shopping_cart),
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
