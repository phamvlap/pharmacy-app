import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../components/dialogs/dialogs.dart';
import '../../utils/utils.dart';
import '../../models/models.dart';
import '../../controllers/controllers.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.mainBackgroundColor,
        child: Column(
          children: [
            const UserInfoSection(),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView(
                children: const <Widget>[
                  OrderSection(),
                  SizedBox(height: 16.0),
                  AccountSection(),
                  SizedBox(height: 16.0),
                  LogoutButtonSection(),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const MyAppDrawer(),
      bottomNavigationBar:
          const AppNavigationBar(routeName: RouteNames.profile),
    );
  }
}

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = context.read<AuthController>().user!;
    return Container(
      height: 90.0,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
      ),
      alignment: Alignment.center,
      child: ListTile(
        leading: Image.asset('assets/default_avatar.png'),
        title: Text(
          user.name,
          style: const TextStyle(
            fontSize: AppFontSizes.textNormal,
            color: AppColors.whiteColor,
          ),
        ),
        subtitle: Text(
          user.phoneNumber,
          style: const TextStyle(
            fontSize: AppFontSizes.textSmall,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}

class OrderSection extends StatelessWidget {
  const OrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Đơn của tôi',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30.0,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RouteNames.myOrderDetail, arguments: 0);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  ),
                  child: const Text(
                    'Xem tất cả',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                OrderInformationButton(
                  icon: const Icon(Icons.sticky_note_2_outlined, size: 32.0),
                  title: 'Chờ xử lý',
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RouteNames.myOrderDetail, arguments: 0);
                  },
                ),
                OrderInformationButton(
                  icon: const Icon(Icons.local_shipping_outlined, size: 32.0),
                  title: 'Đang giao',
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RouteNames.myOrderDetail, arguments: 1);
                  },
                ),
                OrderInformationButton(
                  icon: const Badge(
                    alignment: Alignment(0.2, -0.8),
                    label: Icon(
                      Icons.check,
                      color: AppColors.whiteColor,
                      size: 10.0,
                    ),
                    textStyle: TextStyle(color: Colors.white),
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.local_shipping_outlined, size: 32.0),
                  ),
                  title: 'Đã giao',
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RouteNames.myOrderDetail, arguments: 2);
                  },
                ),
                OrderInformationButton(
                  icon: Badge(
                    alignment: const Alignment(0.2, -0.8),
                    label: const Icon(
                      Icons.arrow_back,
                      color: AppColors.whiteColor,
                      size: 10.0,
                    ),
                    textStyle: const TextStyle(color: Colors.white),
                    backgroundColor: AppColors.secondaryColor,
                    child: const Icon(Icons.sticky_note_2_outlined, size: 32.0),
                  ),
                  title: 'Đổi trả',
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RouteNames.myOrderDetail, arguments: 3);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Tài khoản',
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                AccountInformationButton(
                  icon: Icons.account_circle_outlined,
                  title: 'Thông tin cá nhân',
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteNames.userInformation);
                  },
                ),
                AccountInformationButton(
                  icon: Icons.location_on_outlined,
                  title: 'Quản lí địa chỉ',
                  onPressed: () {},
                ),
                AccountInformationButton(
                  icon: Icons.payment_outlined,
                  title: 'Phương thức thanh toán',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderInformationButton extends StatelessWidget {
  final Widget icon;
  final String title;
  final void Function()? onPressed;
  const OrderInformationButton({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.blackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: onPressed,
      child: Column(
        children: <Widget>[
          icon,
          Text(
            title,
            style: const TextStyle(
              fontSize: AppFontSizes.textSmall,
            ),
          ),
        ],
      ),
    );
  }
}

class LogoutButtonSection extends StatelessWidget {
  const LogoutButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => const ConfirmLogoutDialog(),
        );
      },
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.grey[100],
        foregroundColor: AppColors.blackColor,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.logout),
          SizedBox(width: 8.0),
          Text(
            'Đăng xuất',
            style: TextStyle(
              fontSize: AppFontSizes.textNormal,
            ),
          ),
        ],
      ),
    );
  }
}

class AccountInformationButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onPressed;
  const AccountInformationButton({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Icon(icon),
      title: Text(title),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
    );
  }
}
