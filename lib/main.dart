import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './models/models.dart';
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

    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const ScreenRenderer(),
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
        final productController = ProductController();

        if (settings.name == RouteNames.productDetail) {
          final String productId = settings.arguments as String;
          final Product product = productController.findById(productId);

          return MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product),
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
  }
}
