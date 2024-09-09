import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 20.0,
              child: ElevatedButton(
                onPressed: () {
                  print('More options');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                ),
                child: const Icon(
                  Icons.menu,
                ),
              ),
            ),
            Text(title),
            SizedBox(
              width: 20.0,
              child: ElevatedButton(
                onPressed: () {
                  print('Showing notifications');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                ),
                child: const Icon(
                  Icons.notifications,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Drug Sales App',
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Trang chủ',
        ),
        NavigationDestination(
          icon: Icon(Icons.chat),
          label: 'Tư vấn',
        ),
        NavigationDestination(
          icon: Icon(Icons.shopping_cart),
          label: 'Giỏ hàng',
        ),
        NavigationDestination(
          icon: Icon(Icons.person),
          label: 'Tài khoản',
        ),
      ]),
    );
  }
}
