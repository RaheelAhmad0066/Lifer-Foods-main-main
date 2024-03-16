import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifer_food/core/utils/app_textstyle.dart';
import 'package:lifer_food/core/utils/colors.dart';
import 'package:lifer_food/core/utils/custom_buttons.dart';
import 'package:lifer_food/core/utils/res.dart';
import 'package:lifer_food/core/utils/size_config.dart';
import 'package:lifer_food/presentation/widgets/custom_decorator.dart';
import 'package:lifer_food/presentation/widgets/custom_shape.dart';
import 'package:lifer_food/presentation/workshop/checkout/checkout.dart';

import 'cart_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> carts = [];

  @override
  void initState() {
    populateCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CreateCustomButton(
          text: 'Checkout',
          round: false,
          width: getWidth(context),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CheckoutPage(),
                ));
          },
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10.sp),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateWidth(10.sp)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.sp),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 42.sp,
                      width: 37.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateWidth(15.sp)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    'Cart',
                    style: AppTextStyle.pageTitle.copyWith(fontSize: 36.sp),
                  ),
                  FloatingActionButton.small(
                    onPressed: null,
                    backgroundColor: AppColors.primaryColor,
                    heroTag: null,
                    child: Text(carts.length.toString()),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),

            ///main container
            CustomDecorator(
              children: [
                Text(
                  'The items you selected',
                  style: AppTextStyle.text.copyWith(
                    color: const Color(0xff808191),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Text(
                  'Western BBQ Cheeseburger Meal',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.heading.copyWith(
                    color: const Color(0xffFFB100),
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: carts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      dense: true,
                      visualDensity:
                          const VisualDensity(vertical: -2, horizontal: -1),
                      leading: Image.asset(carts[index].image,
                          height: 25, width: 25, fit: BoxFit.cover),
                      minLeadingWidth: 20,
                      title: Text(carts[index].name),
                      subtitle: Text(
                        'Rs.${carts[index].price}',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                      trailing: SizedBox(
                        width: getWidth(context) * .22,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                if (carts[index].quantity > 1) {
                                  --carts[index].quantity;

                                  carts[index].totalPrice =
                                      carts[index].quantity *
                                          carts[index].price;
                                } else {
                                  carts.removeAt(index);
                                }
                                setState(() {});
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: ShapeDecoration(
                                  shape: const CircleBorder(),
                                  color: AppColors.primaryColor,
                                ),
                                child: const Icon(Icons.remove,
                                    size: 20, color: Colors.white),
                              ),
                            ),
                            Text(carts[index].quantity.toString()),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  ++carts[index].quantity;

                                  carts[index].totalPrice =
                                      carts[index].quantity *
                                          carts[index].price;
                                });
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: ShapeDecoration(
                                  shape: const CircleBorder(),
                                  color: AppColors.primaryColor,
                                ),
                                child: const Icon(Icons.add,
                                    size: 20, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: CreateCustomButton(
                    text: 'Add More',
                    //width: getWidth(context),
                    round: false,
                    onTap: () {},
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateWidth(20.sp)),
                  child: CustomPaint(
                    painter: PaymentDecorator(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 10.sp),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Net Total'),
                              Text(_buildNetTotal()),
                            ],
                          ),
                          const Divider(color: Colors.white),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Delivery Charges'),
                              Text('Rs.100'),
                            ],
                          ),
                          const Divider(color: Colors.white),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Amount',
                                style: AppTextStyle.title3.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                _buildTotal(),
                                style: AppTextStyle.pageTitle.copyWith(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //SizedBox(height: 15,),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 15),
                //   child: CreateCustomButton(
                //     text: 'Checkout',
                //     round: false,
                //     width: getWidth(context),
                //     onTap: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => const CheckoutPage(),
                //           ));
                //     },
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  LinearGradient _gradient() {
    final LinearGradient gradient = LinearGradient(
      colors: [const Color(0xfffeecc5), Colors.white.withOpacity(0.2)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    return gradient;
  }

  void populateCart() {
    carts.addAll([
      CartItem(
        productId: 123,
        quantity: 3,
        price: 100,
        totalPrice: 300,
        image: 'assets/images/food1.jpeg',
        name: 'Spicy Beast Burger',
      ),
      CartItem(
        productId: 124,
        quantity: 5,
        price: 40,
        totalPrice: 200,
        image: 'assets/images/food2.jpeg',
        name: 'Spicy Zinger Shy',
      ),
      CartItem(
        productId: 125,
        quantity: 2,
        price: 50,
        totalPrice: 100,
        image: 'assets/images/food3.jpeg',
        name: 'Special Fried Fish',
      ),
    ]);
  }

  String _buildNetTotal() {
    num netTotal = 0.0;
    for (var item in carts) {
      netTotal = netTotal + item.totalPrice;
    }

    return 'Rs.$netTotal';
  }

  String _buildTotal() {
    num total = 100.0;
    for (var item in carts) {
      total = total + item.totalPrice;
    }

    return 'Rs.${total.toStringAsFixed(0)}';
  }
}
