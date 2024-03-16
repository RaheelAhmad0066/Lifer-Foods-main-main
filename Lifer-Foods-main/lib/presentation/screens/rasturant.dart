import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifer_food/core/utils/app_images.dart';
import 'package:lifer_food/core/utils/screen_size_config.dart';
import 'package:lifer_food/presentation/screens/meal/meal.dart';

class Discoverypage extends StatefulWidget {
  @override
  _DiscoverypageState createState() => _DiscoverypageState();
}

class _DiscoverypageState extends State<Discoverypage>
    with TickerProviderStateMixin {
  late TabController _mainTabController;
  late TabController _nestedTabController;

  @override
  void initState() {
    super.initState();
    _mainTabController = TabController(length: 3, vsync: this);
    _nestedTabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _mainTabController.dispose();
    _nestedTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  pinned: false,
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: buildHeader(),
                  ),
                  expandedHeight: 340.0,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(48.0),
                    child: buildBottomAppBar(),
                  )),
            ];
          },
          body: buildTabBarView(),
        ),
      ),
    );
  }

  Widget buildTabBarView() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: TabBarView(
            controller: _mainTabController,
            children: List.generate(
              3,
              (nestedTabIndex) => DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    buildInnerTabBar(),
                    buildInnerTabBarView(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Image.asset(
            'assets/images/mc_pic.png',
            fit: BoxFit.cover,
          ),
          height: getProportionateScreenHeight(181),
          width: double.infinity,
        ),
        SizedBox(height: getProportionateScreenHeight(18)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: buildHeaderContent(),
        ),
      ],
    );
  }

  Widget buildHeaderContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildLogoAndName(),
            SizedBox(width: getProportionateScreenWidth(5)),
            buildStarIcon(),
          ],
        ),
        SizedBox(height: getProportionateScreenHeight(21)),
        buildRatings(),
        buildDeliveryInfo(),
        buildCategory(),
      ],
    );
  }

  Widget buildLogoAndName() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: getProportionateScreenHeight(64),
            child: CircleAvatar(
              backgroundColor: Colors.redAccent,
              child: Image.asset(
                AppImages.mclogo,
                height: getProportionateScreenHeight(28),
                width: getProportionateScreenWidth(24),
              ),
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(15)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: getProportionateScreenHeight(42),
                child: AutoSizeText(
                  'McDonald’s',
                  maxLines: 1,
                  style: TextStyle(
                    color: Color(0xff292D32),
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                height: getProportionateScreenHeight(23),
                child: buildLocationInfo(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLocationInfo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Image.asset("assets/images/location.png"),
        ),
        SizedBox(width: getProportionateScreenWidth(6)),
        AutoSizeText(
          'Bramlea & Sandalwood',
          maxLines: 1,
          style: TextStyle(
            color: Color(0xff292D3287),
            fontFamily: GoogleFonts.inter().fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget buildStarIcon() {
    return Container(
      height: getProportionateScreenHeight(24),
      width: getProportionateScreenWidth(24),
      child: Icon(
        Icons.star,
        color: Colors.yellow,
      ),
    );
  }

  Widget buildRatings() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Image.asset("assets/images/star.png"),
        ),
        SizedBox(width: getProportionateScreenWidth(6)),
        AutoSizeText(
          'Ratings: 4.5',
          maxLines: 1,
          style: TextStyle(
            color: Color(0xff292D32),
            fontFamily: GoogleFonts.inter().fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget buildDeliveryInfo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Image.asset("assets/images/box.png"),
        ),
        SizedBox(width: getProportionateScreenWidth(6)),
        AutoSizeText(
          'Delivers in 15-20 min',
          maxLines: 1,
          style: TextStyle(
            color: Color(0xff292D32),
            fontFamily: GoogleFonts.inter().fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget buildCategory() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Image.asset("assets/images/burger.png"),
        ),
        SizedBox(width: getProportionateScreenWidth(6)),
        AutoSizeText(
          'Burgers',
          maxLines: 1,
          style: TextStyle(
            color: Color(0xff292D32),
            fontFamily: GoogleFonts.inter().fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget buildBottomAppBar() {
    List<String> tabNames = [
      'Breakfast Menu',
      'Lunch & Dinner',
      'Overnight Menu'
    ];

    return Container(
      color: Color(0xffF9F0DD),
      child: TabBar(
        isScrollable: true,
        unselectedLabelStyle: TextStyle(
          fontSize: getProportionateScreenWidth(16),
        ),
        labelStyle: TextStyle(
          fontSize: getProportionateScreenWidth(18),
        ),
        indicatorColor: Color(0xff292D32),
        labelColor: Color(0xffFFB100),
        unselectedLabelColor: Color(0xff8C8C8CB5),
        // tabAlignment: TabAlignment.,
        controller: _mainTabController,
        tabs: List.generate(
          tabNames.length,
          (mainTabIndex) => Tab(
            child: AutoSizeText(
              tabNames[mainTabIndex],
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInnerTabBar() {
    List<String> tabNames = ['Today’s Deals', 'Burger Meals', 'Chicken & Fish'];

    return Container(
      child: TabBar(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
        ),
        labelStyle: TextStyle(
          fontSize: 14,
        ),
        indicatorSize: null,
        indicatorColor: Colors.transparent,
        labelColor: Color(0xffFFB100),
        unselectedLabelColor: Color(0xff8C8C8CB5),
        controller: _nestedTabController,
        tabs: List.generate(
          tabNames.length,
          (mainTabIndex) => Tab(
            child: Container(
              alignment: Alignment.center,
              height: getProportionateScreenHeight(40),
              width: getProportionateScreenWidth(133),
              decoration: BoxDecoration(
                color: Color(0xffF9F0DD),
                borderRadius: BorderRadius.circular(50),
              ),
              child: AutoSizeText(
                tabNames[mainTabIndex],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInnerTabBarView() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: TabBarView(
          controller: _nestedTabController,
          children: [
            buildInnerTabContent("Today’s Deals"),
            buildInnerTabContent("Burger Meals"),
            buildInnerTabContent("Chicken & Fish"),
          ],
        ),
      ),
    );
  }

  Widget buildInnerTabContent(String tabName) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) {
        return Divider(
          height: 1.sp,
          thickness: 1,
          color: Color(0xffD5DEE7),
        );
      },
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => MealScreen()));
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                "assets/images/macburger.png",
                height: getProportionateScreenHeight(28),
                width: getProportionateScreenWidth(24),
              ),
            ),
            title: AutoSizeText(
              'Mac burger and reg cola',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.inter().fontFamily,
                  color: Color(0xff292D32)),
            ),
            subtitle: AutoSizeText(
              '\$10.67',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: GoogleFonts.inter().fontFamily,
                  color: Color(0xffFFB100)),
            ),
            trailing: Icon(Icons.keyboard_arrow_right_rounded,
                size: getProportionateScreenWidth(24),
                color: Color(0xff292D32)),
          ),
        );
      },
    );
  }
}
