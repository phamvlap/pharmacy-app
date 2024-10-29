import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import './controllers/controllers.dart';
import './utils/utils.dart';
import './ui/screens.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const DrugSalesApp());
}

class DrugSalesApp extends StatelessWidget {
  const DrugSalesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.light();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => UserController(),
        ),
      ],
      child: Consumer<AuthController>(
        builder: (context, AuthController, child) {
          return MaterialApp(
            theme: theme,
            debugShowCheckedModeBanner: false,
            home: AuthController.isLoggedIn()
                ? const ScreenRenderer(path: RouteNames.home)
                : FutureBuilder(
                    future: AuthController.tryAutoLogin(),
                    builder: (context, snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? const SafeArea(child: SplashScreen())
                          : const SafeArea(child: LoginScreen());
                    }),
            routes: {
              RouteNames.consult: (context) =>
                  const ScreenRenderer(path: RouteNames.consult),
              RouteNames.cart: (context) =>
                  const ScreenRenderer(path: RouteNames.cart),
              RouteNames.profile: (context) =>
                  const ScreenRenderer(path: RouteNames.profile),
              RouteNames.login: (context) =>
                  const ScreenRenderer(path: RouteNames.login),
              RouteNames.register: (context) =>
                  const ScreenRenderer(path: RouteNames.register),
              RouteNames.userInformation: (context) =>
                  const ScreenRenderer(path: RouteNames.userInformation),
              RouteNames.editUserInformation: (context) =>
                  const ScreenRenderer(path: RouteNames.editUserInformation),
            },
            onGenerateRoute: (settings) {
              if (settings.name == RouteNames.productDetail) {
                final String productId = settings.arguments as String;

                return MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    context.read<ProductController>().findById(productId)!,
                  ),
                );
              } else if (settings.name == RouteNames.myOrderDetail) {
                final int initialIndex = settings.arguments as int;
                return MaterialPageRoute(
                  builder: (context) =>
                      MyOrderDetailScreen(initialIndex: initialIndex),
                );
              }

              return null;
            },
          );
        },
      ),
    );
  }
}
