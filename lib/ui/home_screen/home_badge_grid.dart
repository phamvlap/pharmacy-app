import 'package:flutter/material.dart';

import './home_badge_tile.dart';

class HomeBadgeGrid extends StatelessWidget {
  HomeBadgeGrid({super.key});

  final List<HomeBadgeTile> _homeBadgeTiles = [
    HomeBadgeTile(
      icon: const Icon(
        Icons.receipt_outlined,
        size: 32.0,
      ),
      title: 'Đặt thuốc\ntheo đơn',
      onPressed: () {},
    ),
    HomeBadgeTile(
      icon: const Icon(
        Icons.location_on_outlined,
        size: 32.0,
      ),
      title: 'Hệ thống\nnhà thuốc',
      onPressed: () {},
    ),
    HomeBadgeTile(
      icon: const Icon(
        Icons.phone_iphone_rounded,
        size: 32.0,
      ),
      title: 'Liên hệ\ndược sĩ',
      onPressed: () {},
    ),
    HomeBadgeTile(
      icon: const Icon(
        Icons.sell_outlined,
        size: 32.0,
      ),
      title: 'Mã\ngiảm giá',
      onPressed: () {},
    ),
    HomeBadgeTile(
      icon: const Icon(
        Icons.schedule,
        size: 32.0,
      ),
      title: 'Đặt lịch',
      onPressed: () {},
    ),
    HomeBadgeTile(
      icon: const Icon(
        Icons.date_range_outlined,
        size: 32.0,
      ),
      title: 'Hồ sơ\nsức khoẻ',
      onPressed: () {},
    ),
    HomeBadgeTile(
      icon: const Icon(
        Icons.shopping_bag_outlined,
        size: 32.0,
      ),
      title: 'Đơn của tôi',
      onPressed: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: _homeBadgeTiles.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 3 / 4,
      ),
      itemBuilder: (context, index) => _homeBadgeTiles[index],
    );
  }
}
