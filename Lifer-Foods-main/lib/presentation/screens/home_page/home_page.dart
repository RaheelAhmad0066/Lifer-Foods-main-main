import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifer_food/core/utils/app_images.dart';
import 'package:lifer_food/core/utils/custom_buttons.dart';
import 'package:lifer_food/core/utils/screen_size_config.dart';
import 'package:lifer_food/model/food_images_model.dart';
import 'package:lifer_food/model/trending_model.dart';
import 'package:lifer_food/presentation/screens/meal/meal.dart';
import 'package:lifer_food/presentation/workshop/search/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(getProportionateScreenWidth(21)),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: getProportionateScreenWidth(7)),
                            child: Image.asset(
                              'assets/images/home_logo.png',
                              height: getProportionateScreenHeight(50),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(12),
                                  vertical: getProportionateScreenHeight(10)),
                              child: Row(children: [
                                Container(
                                  child: Icon(
                                    Icons.location_on,
                                    size: getProportionateScreenWidth(20),
                                  ),
                                ),
                                SizedBox(width: getProportionateScreenWidth(4)),
                                AutoSizeText(
                                  '32, Kingston Ln.',
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                )
                              ]),
                            ),
                            round: 10,
                            width: getProportionateScreenWidth(170),
                            height: getProportionateScreenHeight(43),
                            onTap: () {},
                          ),
                          SizedBox(width: getProportionateScreenWidth(10)),
                          CustomButton(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(12),
                                  vertical: getProportionateScreenHeight(10)),
                              child: Row(children: [
                                Container(
                                  child: Icon(
                                    Icons.access_time_filled_outlined,
                                    size: getProportionateScreenWidth(20),
                                  ),
                                ),
                                SizedBox(width: getProportionateScreenWidth(4)),
                                AutoSizeText(
                                  'Order Now',
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                )
                              ]),
                            ),
                            round: 10,
                            width: getProportionateScreenWidth(170),
                            height: getProportionateScreenHeight(43),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchPage(),
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(13),
                            vertical: getProportionateScreenHeight(14)),
                        width: getProportionateScreenWidth(348),
                        height: getProportionateScreenHeight(52),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(174, 239, 242, 245),
                            borderRadius: BorderRadius.circular((12))),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppImages.searchlogo,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Search Food, Restaurants etc.',
                              style: TextStyle(
                                  color: Color.fromRGBO(140, 140, 140, 0.8)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(35),
                    ),
                    Container(
                      height: getProportionateScreenHeight(257),
                      width: getProportionateScreenWidth(348),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFBC252), // Color without alpha (opaque)
                              Color(
                                  0x00FBC252) // Color with alpha (transparent)
                              // Color(0xFFFBC252),
                            ],
                            stops: [0.1854, 0.8521],
                            // Corresponding to the percentage values in the CSS
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            // transform: GradientRotation(3.14159),
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: getProportionateScreenHeight(-55),
                            left: 0,
                            right: 0,
                            child: Image.asset(
                              AppImages.homefood,
                              height: getProportionateScreenHeight(232),
                              width: getProportionateScreenWidth(376),
                            ),
                          ),
                          Positioned(
                            bottom: getProportionateScreenHeight(45),
                            left: 14,
                            child: Container(
                              height: getProportionateScreenHeight(42),
                              width: getProportionateScreenWidth(139),
                              child: FittedBox(
                                child: AutoSizeText(
                                  'Self Pickup',
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Color(0xffFFB100),
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: getProportionateScreenHeight(14),
                            left: 14,
                            child: Container(
                              height: getProportionateScreenHeight(35),
                              width: getProportionateScreenWidth(195),
                              child: FittedBox(
                                child: AutoSizeText(
                                  'Pick your own food',
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Color(0xffFFB100),
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(11),
              ),
              Divider(
                height: 1.sp,
                thickness: 1,
                color: Color(0xffD5DEE7),
              ),
              Padding(
                padding: EdgeInsets.all(getProportionateScreenWidth(21)),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: AutoSizeText(
                        'Offers Near you',
                        maxLines: 1,
                        style: TextStyle(
                          color: Color(0xff292D32),
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(21),
                    ),
                    Container(
                      height: getProportionateScreenHeight(200),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: foods.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: getProportionateScreenWidth(7),
                          );
                        },
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MealScreen(),
                                  ));
                            },
                            child: Container(
                              width: getProportionateScreenWidth(140),
                              height: getProportionateScreenHeight(180),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      foods[index].imageUrl,
                                    ),
                                  )),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1.sp,
                thickness: 1,
                color: Color(0xffD5DEE7),
              ),
              Padding(
                padding: EdgeInsets.all(getProportionateScreenWidth(21)),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: AutoSizeText(
                        'New & Trending',
                        maxLines: 1,
                        style: TextStyle(
                          color: Color(0xff292D32),
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(21),
                    ),
                    Container(
                      height: getProportionateScreenHeight(200),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: trendingItems.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: getProportionateScreenWidth(20),
                          );
                        },
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MealScreen(),
                                  ));
                            },
                            child: Card(
                              shadowColor: Colors.transparent,
                              color: Colors.white.withOpacity(0),
                              elevation: 20,
                              child: Container(
                                width: getProportionateScreenWidth(166),
                                height: getProportionateScreenHeight(177),
                                decoration: BoxDecoration(

                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.grey[200]!,
                                    //     blurRadius:
                                    //         2.0, // has the effect of softening the shadow
                                    //     spreadRadius:
                                    //         2.0, // has the effect of extending the shadow
                                    //     offset: Offset(
                                    //       5.0, // horizontal, move right 10
                                    //       5.0, // vertical, move down 10
                                    //     ),
                                    //   )
                                    // ],

                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white,
                                        // Color without alpha (opaque)
                                        Color.fromARGB(0, 222, 221, 220),
                                        Color.fromARGB(0, 222, 221, 220),
                                        // const Color.fromARGB(255, 224, 29,
                                        //     29), // Color without alpha (opaque)
                                        // Color.fromARGB(255, 237, 236, 236)
                                        //     .withOpacity(
                                        //         0), // Color with alpha (transparent)
                                      ],
                                      stops: [
                                        0.0,
                                        0.79,
                                        // Start point (left) - First color
                                        0.8,
                                        // Position 47 out of 50 - Second color
                                      ],
                                      begin: Alignment.topLeft,
                                      // Start the gradient from the left
                                      end: Alignment
                                          .topRight, // End the gradient at the center
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Image.asset(
                                        trendingItems[index].image,
                                        height:
                                            getProportionateScreenHeight(135),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: getProportionateScreenHeight(15),
                                      left: getProportionateScreenWidth(9),
                                      child: Row(
                                        children: [
                                          Container(
                                            // height: getProportionateScreenHeight(37),
                                            width: getProportionateScreenWidth(
                                                128),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height:
                                                      getProportionateScreenHeight(
                                                          36),
                                                  width:
                                                      getProportionateScreenWidth(
                                                          36),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Color(0xff8492AD1A),
                                                    child: Image.asset(
                                                      trendingItems[index].logo,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      getProportionateScreenWidth(
                                                          8),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      trendingItems[index]
                                                          .restaurant,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff292D32),
                                                        fontFamily: GoogleFonts
                                                                .poppins()
                                                            .fontFamily,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    AutoSizeText(
                                                      ' ${trendingItems[index].distance.toString()} mi',
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff292D3299),
                                                        fontFamily:
                                                            GoogleFonts.inter()
                                                                .fontFamily,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(5),
                                          ),
                                          Container(
                                            height:
                                                getProportionateScreenHeight(
                                                    24),
                                            width:
                                                getProportionateScreenWidth(24),
                                            child:
                                                trendingItems[index].isStarred
                                                    ? Icon(
                                                        Icons.star,
                                                        color: Colors.yellow,
                                                      )
                                                    : Icon(Icons.star_border),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
