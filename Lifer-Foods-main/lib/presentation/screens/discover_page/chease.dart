import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifer_food/core/controler/controler.dart';
import 'package:lifer_food/core/utils/screen_size_config.dart';

class BurgerItemList extends StatefulWidget {
  @override
  _BurgerItemListState createState() => _BurgerItemListState();
}

class _BurgerItemListState extends State<BurgerItemList> {
  final contr = Get.put(CounterControler());
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 10,
        );
      },
      itemCount: contr.items.length,
      itemBuilder: (context, index) {
        return GetBuilder<CounterControler>(
          builder: (controller) {
            return GestureDetector(
              onTap: () {},
              child: Material(
                // elevation: _selectedItemIndex == index ? 4.0 : 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    dense: true,
                    leading: Image.asset(
                      controller.items[index]['image'],
                      width: 40,
                      height: 40,
                    ),
                    title: Text(controller.items[index]['name']),
                    subtitle: Text(
                      "${controller.items[index]['price']}",
                      style: TextStyle(
                        color: Color(
                          0xffFFB100,
                        ),
                      ),
                    ),
                    trailing: Container(
                      width: getProportionateScreenWidth(
                          75), // Adjust the width as needed
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.decrementItem(index);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: getProportionateScreenWidth(25),
                              height: getProportionateScreenHeight(25),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffFFB100),
                              ),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 13,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: getProportionateScreenWidth(25),
                            height: getProportionateScreenHeight(25),
                            child: AutoSizeText(
                              "${controller.items[index]['count']}", // Display the quantity or implement your logic
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: getProportionateScreenHeight(18),
                                  color: Color(0xff272727)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.incrementItem(index);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: getProportionateScreenWidth(25),
                              height: getProportionateScreenHeight(25),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffFFB100),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
