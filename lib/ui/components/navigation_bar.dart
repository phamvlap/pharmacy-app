import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens.dart';
import '../../controllers/controllers.dart';
import '../../utils/utils.dart';
import '../components/dialogs/dialogs.dart';
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
        if (path == RouteNames.cart) {
          bool isLoggedIn = context.read<AuthController>().isLoggedIn();
          if (!isLoggedIn) {
            showDialog(
              context: context,
              builder: (BuildContext context) => const RequireLoginDialog(),
            );
            return;
          }
          Navigator.of(context).pushNamed(RouteNames.cart);
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
