import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lifer_food/core/utils/app_images.dart';
import 'package:lifer_food/core/utils/screen_size_config.dart';
import 'package:lifer_food/presentation/screens/profile/profile.dart';
import 'package:lifer_food/presentation/screens/home_page/home_page.dart';
import '../order_history/order_history.dart';
import '../payment/payment_page.dart';

class CurvedNavigationbar extends StatefulWidget {
  const CurvedNavigationbar({Key? key}) : super(key: key);

  @override
  _CurvedNavigationbarState createState() => _CurvedNavigationbarState();
}

class _CurvedNavigationbarState extends State<CurvedNavigationbar> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  int index = 1;
  final items = [
    Image.asset(
      height: 40,
      AppImages.history,
    ),
    // Image.asset(
    //   height: 40,
    //   AppImages.messageicon,
    // ),
    Image.asset(
      height: 40,
      AppImages.homeicon,
    ),
    Image.asset(
      height: 40,
      AppImages.walleticon,
    ),
    Image.asset(
      AppImages.profileicon,
      height: 40,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        items: items,
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        buttonBackgroundColor: const Color(0xffFFB100),
        // height: getProportionateScreenHeight(70),
        backgroundColor: Colors.transparent,
        color: const Color(0xff292F34),
        animationDuration: const Duration(milliseconds: 300),
        // animationCurve: ,
      ),
      body: getSelectedWidget(index: index),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const OrdersHistory();
        break;
      case 1:
        widget = HomePage();
        break;
      case 2:
        widget = const PaymentPage();
        break;
      // case 3:
      //   widget = const ProfilePage();
      //   break;
      default:
        widget = const ProfilePage();
        break;
    }
    return widget;
  }
}
