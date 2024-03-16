import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lifer_food/core/AuthControler/auth.dart';
import 'package:lifer_food/core/utils/res.dart';

import '../../../core/utils/PrefUtils.dart';
import 'edit_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController emailCont = TextEditingController();
  final user = Get.find<PrefUtils>().getBool('userId') ?? false;
  final token = Get.find<PrefUtils>().getString('userToken')??'';
  final controler = Get.find<AuthService>();
  @override
  void initState() {
    nameCont.text = 'Muhammad Ali';
    emailCont.text = 'user@gmail.com';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: getHeight(context) * .4,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xffFFF4D9),
                  borderRadius: BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(200),
                      bottomStart: Radius.circular(200))),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Profile',
                          style: TextStyle(
                              fontSize: 24.sp, fontWeight: FontWeight.bold),
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
                  Positioned(
                    top: 180.h,
                    left: 78.w,
                    child: Container(
                        height: getHeight(context) * .18,
                        width: getWidth(context) * .6,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400,
                                  offset: Offset(1, 2),
                                  blurRadius: 2,
                                  spreadRadius: 2)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/images/food2.jpeg'),
                            ),
                            Text(
                              controler.userdata.firstName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 21.sp),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Iconsax.call),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                       controler.userdata.contactNo,
                        style: TextStyle(
                            color: Color(0xff464255), fontSize: 18.sp),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email_outlined),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        controler.userdata.email,
                        style: TextStyle(
                            color: Color(0xff464255), fontSize: 18.sp),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: getHeight(context) * 0.03,
            ),
            listile(
              title: 'Edit Profile',
              icon: Iconsax.edit,
              ontap: () {
                // Get.to(EditProfile());
              print(user);
              print(token);

              },
            ),
            listile(
              title: 'Change Password',
              icon: Iconsax.password_check,
              ontap: () {
                final controler = Get.put(AuthService());
                print(controler.userId);
              },
            ),
            listile(
              title: 'Logout',
              icon: Iconsax.logout,
              ontap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class listile extends StatelessWidget {
  listile(
      {super.key,
      required this.title,
      required this.icon,
      required this.ontap});
  final String title;
  final IconData icon;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(15.0), // Set border radius to 15.0
          border: Border.all(color: Color(0xffFFB100)), // Set border color to amber
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Set shadow color
              spreadRadius: 3, // Set spread radius
              blurRadius: 5, // Set blur radius
              offset: Offset(0, 3), // Set offset of the shadow
            ),
          ],
        ),
        child: ListTile(
          onTap: ontap,
          leading: CircleAvatar(
            backgroundColor: Color(0xffFFB100),
            child: Icon(
              icon, // Note: The correct icon name is 'Icons.edit'
              color: Colors.white,
            ),
          ),
          title: Center(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
          ),
        ),
      ),
    );
  }
}
