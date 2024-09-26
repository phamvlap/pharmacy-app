import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class MyAppDrawer extends StatefulWidget {
  const MyAppDrawer({super.key});

  @override
  State<MyAppDrawer> createState() => _MyAppDrawerState();
}

class _MyAppDrawerState extends State<MyAppDrawer> {
  bool _isLoggedIn = false; // TODO: fetch from auth controller or something

  @override
  Widget build(BuildContext context) {
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
                    color: AppColors.secondaryColor,
                    width: 1.0,
                  ),
                ),
              ),
              child: Text(
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
                  DrawerListTile(
                    leading: const Icon(Icons.home, size: 28.0),
                    title: const Text('Trang chủ'),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RouteNames.home);
                    },
                  ),
                  DrawerListTile(
                    leading: const Icon(Icons.chat, size: 28.0),
                    title: const Text('Tư vấn'),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RouteNames.consult);
                    },
                  ),
                  DrawerListTile(
                    leading: const Icon(Icons.shopping_cart, size: 28.0),
                    title: const Text('Giỏ hàng'),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RouteNames.cart);
                    },
                  ),
                  if (_isLoggedIn) ...[
                    DrawerListTile(
                      leading: const Icon(Icons.person, size: 28.0),
                      title: const Text('Tài khoản'),
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
                      onTap: () {
                        setState(() {
                          _isLoggedIn = false; // TODO: perform logout action
                        });
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
                      onTap: () {
                        Navigator.of(context).pushNamed(RouteNames.login);
                      },
                    ),
                    DrawerListTile(
                      leading: const Icon(Icons.app_registration_rounded,
                          size: 28.0),
                      title: const Text('Đăng ký'),
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
  final void Function()? onTap;

  const DrawerListTile({
    super.key,
    required this.leading,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
