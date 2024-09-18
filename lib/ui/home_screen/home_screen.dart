import 'package:flutter/material.dart';

import './../layouts/app_bar.dart';
import './../layouts/drawer.dart';
import './home_badge_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: HomeBadgeGrid(),
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
      body: const SafeArea(
        child: Text('For testing detail home'),
      ),
    );
  }
}
