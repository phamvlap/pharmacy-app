import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/controllers.dart';
import '../components/dialogs/dialogs.dart';
import '../../utils/utils.dart';
import '../../models/models.dart';

class MyAppDrawer extends StatelessWidget {
  const MyAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = context.read<AuthController>().user;

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          top: 40.0,
          bottom: 0.0,
          left: 20.0,
          right: 20.0,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[500]!,
                    width: 0.5,
                  ),
                ),
              ),
              child: const Text(
                Consts.appName,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: AppFontSizes.displayMedium,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0.0),
                children: [
                  if (context.read<AuthController>().isLoggedIn()) ...[
                    ListTile(
                        leading: Image.asset(
                          'assets/default_avatar.png',
                          width: 40.0,
                          height: 40.0,
                        ),
                        title: Text(
                          user!.name,
                          style: const TextStyle(
                            fontSize: AppFontSizes.textNormal,
                          ),
                        ),
                        subtitle: Text(
                          user.phoneNumber,
                          style: TextStyle(
                            fontSize: AppFontSizes.textSmall,
                            color: Colors.grey[800]!,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(RouteNames.profile);
                        }),
                    Divider(
                      color: Colors.grey[500],
                      thickness: 0.5,
                    ),
                  ],
                  DrawerListTile(
                    leading: const Icon(Icons.home, size: 28.0),
                    title: const Text('Trang chủ'),
                    routeName: RouteNames.home,
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RouteNames.home);
                    },
                  ),
                  DrawerListTile(
                    leading: const Icon(Icons.chat, size: 28.0),
                    title: const Text('Tư vấn'),
                    routeName: RouteNames.consult,
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RouteNames.consult);
                    },
                  ),
                  DrawerListTile(
                    leading: const Icon(Icons.shopping_cart, size: 28.0),
                    title: const Text('Giỏ hàng'),
                    routeName: RouteNames.cart,
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteNames.cart);
                    },
                  ),
                  if (context.read<AuthController>().isLoggedIn()) ...[
                    DrawerListTile(
                      leading: const Icon(Icons.person, size: 28.0),
                      title: const Text('Tài khoản'),
                      routeName: RouteNames.profile,
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RouteNames.profile);
                      },
                    ),
                    Divider(
                      color: Colors.grey[500],
                      thickness: 0.5,
                    ),
                    DrawerListTile(
                      leading: const Icon(Icons.logout, size: 28.0),
                      title: const Text('Đăng xuất'),
                      routeName: RouteNames.logout,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const ConfirmLogoutDialog(),
                        );
                      },
                    ),
                  ] else ...[
                    Divider(
                      color: Colors.grey[500],
                      thickness: 0.5,
                    ),
                    DrawerListTile(
                      leading: const Icon(Icons.login, size: 28.0),
                      title: const Text('Đăng nhập'),
                      routeName: RouteNames.login,
                      onTap: () {
                        Navigator.of(context).pushNamed(RouteNames.login);
                      },
                    ),
                    DrawerListTile(
                      leading: const Icon(Icons.app_registration_rounded,
                          size: 28.0),
                      title: const Text('Đăng ký'),
                      routeName: RouteNames.register,
                      onTap: () {
                        Navigator.of(context).pushNamed(RouteNames.register);
                      },
                    ),
                  ]
                ],
              ),
            ),
            const Text('Version 1.0'),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final String? routeName;
  final void Function()? onTap;

  const DrawerListTile({
    super.key,
    required this.leading,
    required this.title,
    this.routeName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final String? currentRouteName = ModalRoute.of(context)!.settings.name;

    return ListTile(
      leading: leading,
      title: title,
      iconColor: AppColors.greyColor,
      textColor: AppColors.greyColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
      onTap: onTap,
      selected: currentRouteName == routeName,
      selectedColor: AppColors.primaryColor,
      selectedTileColor: Colors.grey[200],
      focusColor: Colors.grey[100],
      hoverColor: Colors.grey[100],
    );
  }
}
