import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifer_food/core/controler/controler.dart';
import 'package:lifer_food/core/utils/screen_size_config.dart';
import 'package:lifer_food/presentation/screens/cart_page/cart.dart';
import 'package:lifer_food/presentation/screens/discover_page/chease.dart';
import 'package:lifer_food/presentation/screens/discover_page/itemslist.dart';

import '../discover_page/sideitems/sideitems.dart';

class MealScreen extends StatefulWidget {
  MealScreen({super.key});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  final controler = Get.put(CounterControler());

  bool itemListVisible = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: getProportionateScreenHeight(100),
                  child: ListTile(
                    title: AutoSizeText(
                      "Spicy",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 28),
                    ),
                    subtitle: AutoSizeText(
                      "Beast",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 30),
                    ),
                    trailing: Container(
                        padding: EdgeInsets.only(
                            top: getProportionateScreenHeight(6)),
                        alignment: Alignment.center,
                        height: 57,
                        width: 41,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(27),
                            border:
                                Border.all(color: Color(0xff878787), width: 1)),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black,
                        )),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(22)),
                  height: getProportionateScreenHeight(269),
                  child: Row(children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: getProportionateScreenHeight(49),
                            width: getProportionateScreenWidth(122),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xffFFDF96)),
                            child: AutoSizeText(
                              "\$12.67",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(74),
                          ),
                          Container(
                            width: getProportionateScreenWidth(122),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    controler.dicrement();
                                  },
                                  icon: Icon(Icons.remove),
                                ),
                                Container(
                                  height: getProportionateScreenHeight(41),
                                  // width: getProportionateScreenWidth(40),
                                  child: Obx(
                                    () => AutoSizeText(
                                      controler.counter.value.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontSize: 40),
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      controler.increment();
                                    },
                                    icon: Icon(Icons.add))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/mealburger.png",
                                // width: getProportionateScreenWidth(224),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 39,
                                right: 22,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: getProportionateScreenHeight(90),
                                  width: getProportionateScreenWidth(150),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      AutoSizeText(
                                        "Spicy Patty Burger",
                                        maxLines: 2,
                                        minFontSize: 8,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            fontSize: 14,
                                            color: Color(0xff272727)),
                                      ),
                                      AutoSizeText(
                                        "370 g",
                                        maxLines: 1,
                                        minFontSize: 10,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            fontSize:
                                                getProportionateScreenHeight(
                                                    16),
                                            color: Color(0xff272727)),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Container(
                        height: getProportionateScreenHeight(56),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              "Drinks",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontSize: 21),
                            ),
                            Obx(() => controler.isvisible1.value
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height:
                                            getProportionateScreenHeight(16),
                                        child: FittedBox(
                                          child: AutoSizeText(
                                            "REQUIRED",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                fontSize: 12,
                                                color: Color(0xffCA7816)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(5),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          controler.toggle1();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width:
                                              getProportionateScreenWidth(25),
                                          height:
                                              getProportionateScreenHeight(25),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffB3BFCB)),
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 13,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      controler.toggle1();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: getProportionateScreenWidth(25),
                                      height: getProportionateScreenHeight(25),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xffFFB100)),
                                      child: Icon(
                                        Icons.add,
                                        color: Color(0xffFFFFFF),
                                        size: 13,
                                      ),
                                    ),
                                  ))
                          ],
                        ),
                      ),
                      GetX<CounterControler>(builder: ((controller) {
                        return AnimatedContainer(
                          curve: Curves.easeIn,
                          duration: Duration(milliseconds: 300),
                          height: controler.isvisible1.value
                              ? getProportionateScreenHeight(270)
                              : 0,
                          child: controler.isvisible1.value ? ItemList() : null,
                        );
                      })),
                      Container(
                        height: getProportionateScreenHeight(56),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              "Edit Cheeseburger",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontSize: 21),
                            ),
                            Obx(() => controler.isvisible2.value
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height:
                                            getProportionateScreenHeight(16),
                                        child: FittedBox(
                                          child: AutoSizeText(
                                            "REQUIRED",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                fontSize: 12,
                                                color: Color(0xffCA7816)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(5),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          controler.toggle2();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width:
                                              getProportionateScreenWidth(25),
                                          height:
                                              getProportionateScreenHeight(25),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffB3BFCB)),
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 13,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      controler.toggle2();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: getProportionateScreenWidth(25),
                                      height: getProportionateScreenHeight(25),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xffFFB100)),
                                      child: Icon(
                                        Icons.add,
                                        color: Color(0xffFFFFFF),
                                        size: 13,
                                      ),
                                    ),
                                  )),
                          ],
                        ),
                      ),
                      GetX<CounterControler>(builder: (controler) {
                        return AnimatedContainer(
                          curve: Curves.easeIn,
                          duration: Duration(milliseconds: 300),
                          height: controler.isvisible2.value
                              ? getProportionateScreenHeight(270)
                              : 0,
                          child: controler.isvisible2.value
                              ? BurgerItemList()
                              : null,
                        );
                      }),
                      Container(
                        height: getProportionateScreenHeight(56),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              "Side Item",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontSize: 21),
                            ),
                            Obx(
                              () => controler.isvisible3.value
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height:
                                              getProportionateScreenHeight(16),
                                          child: FittedBox(
                                            child: AutoSizeText(
                                              "REQUIRED",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily:
                                                      GoogleFonts.poppins()
                                                          .fontFamily,
                                                  fontSize: 12,
                                                  color: Color(0xffCA7816)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: getProportionateScreenWidth(5),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            controler.toggle3();
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width:
                                                getProportionateScreenWidth(25),
                                            height:
                                                getProportionateScreenHeight(
                                                    25),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffB3BFCB)),
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                              size: 13,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        controler.toggle3();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: getProportionateScreenWidth(25),
                                        height:
                                            getProportionateScreenHeight(25),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xffFFB100)),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 13,
                                        ),
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                      GetX<CounterControler>(builder: (controler) {
                        return AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: controler.isvisible3.value
                                ? getProportionateScreenHeight(270)
                                : 0,
                            child: controler.isvisible3.value
                                ? SideItemslist()
                                : null);
                      }),
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: AutoSizeText(
                          "Add Additional information",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontSize: 21),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(16),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: AutoSizeText(
                          "You can customize your meal by your own choice",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontSize: 13),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(14),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        height: getProportionateScreenHeight(115),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xffFFB100))),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 6,
                          decoration: InputDecoration(
                            hintText: "Add Additional information",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(14),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartPage(),
                              ));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: getProportionateScreenHeight(50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Color(0xffFFB100),
                              border: Border.all(color: Color(0xffFFB100))),
                          child: AutoSizeText(
                            " Add to cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: getProportionateScreenHeight(20)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
