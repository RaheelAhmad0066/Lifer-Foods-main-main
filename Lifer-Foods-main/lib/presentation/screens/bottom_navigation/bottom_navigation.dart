import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifer_food/core/utils/app_images.dart';
import 'package:lifer_food/core/utils/size_config.dart';
import 'package:lifer_food/presentation/screens/home_page/home_page.dart';

/// A StatefulWidget representing the main bottom navigation for the app.
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

/// The state class for the [BottomNavigation] widget.
class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text('Bookmark'),
    Text('Connect'),
    Text('Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().initSizeConfig(context);

    /// Creates a [BottomNavigationBarItem] with an icon and label.
    BottomNavigationBarItem createBottomNavigationItem(
        String assetPath, String label, bool value) {
      return BottomNavigationBarItem(
        icon: Column(
          children: [
            SvgPicture.asset(
              assetPath,
              height: getProportionateWidth(24),
            ),
            AutoSizeText(label,
                style: TextStyle(
                  color: Color(0XFF292D32),
                  fontFamily: GoogleFonts.inter().fontFamily,
                )),
            SizedBox(
              height: getProportionateHeight(10),
            ),
            value == true
                ? SvgPicture.asset(
                    AppImages.bt_circle,
                    height: getProportionateWidth(5),
                  )
                : Container()
          ],
        ),
        label: label,
      );
    }

    final bottomNavItems = <BottomNavigationBarItem>[
      createBottomNavigationItem(
          _selectedIndex == 0
              ? AppImages.bt_home_bold
              : AppImages.bt_home_linear,
          'Home',
          _selectedIndex == 0),
      createBottomNavigationItem(
          _selectedIndex == 1
              ? AppImages.bt_discover_bold
              : AppImages.bt_discover_linear,
          'Discover',
          _selectedIndex == 1),
      createBottomNavigationItem(
          _selectedIndex == 2
              ? AppImages.bt_receipt_linear
              : AppImages.bt_receipt_linear,
          'Orders',
          _selectedIndex == 2),
      BottomNavigationBarItem(
        icon: SizedBox(
          // height: getProportionateHeight(52),
          // width: getProportionateWidth(32),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateHeight(90),
                width: getProportionateWidth(50),
                child: const FittedBox(
                  child: CircleAvatar(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    foregroundImage: AssetImage(AppImages.bt_person_image),
                  ),
                ),
              ),
              AutoSizeText('Profile',
                  style: TextStyle(
                    color: Color(0XFF292D32),
                    fontFamily: GoogleFonts.inter().fontFamily,
                  )),
              SizedBox(
                height: getProportionateHeight(20),
              ),
              _selectedIndex == 3
                  ? SvgPicture.asset(
                      AppImages.bt_circle,
                      height: getProportionateWidth(5),
                    )
                  : Container()
            ],
          ),
        ),
        label: 'Profile',
      ),
    ];

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffEFF2F5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: bottomNavItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
