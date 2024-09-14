import 'package:flutter/material.dart';

import './../layouts/app_bar.dart';
import './../layouts/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const DetailHome();
                },
              ),
            );
          },
          child: const Text('Home hereeeeee!!!'),
        ),
      ),
      drawer: const MyAppDrawer(),
    );
  }
}

class DetailHome extends StatelessWidget {
  const DetailHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Home'),
      ),
      body: const Text('Detail Home hereeeeee!!!'),
    );
  }
}
