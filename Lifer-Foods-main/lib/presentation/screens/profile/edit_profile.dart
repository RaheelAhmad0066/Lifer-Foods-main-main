import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:lifer_food/core/AuthControler/auth.dart';
import 'package:lifer_food/core/utils/custom_text_field.dart';

import '../../../core/utils/PrefUtils.dart';
import '../../../core/utils/app_textstyle.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/utils/utils.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final firstNameControler = TextEditingController();
  final lastNameControler = TextEditingController();
  final contactControler = TextEditingController();

  final controler = Get.put(AuthService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Full Name',
                    style: AppTextStyle.greetingStyle.copyWith(
                      fontSize: 17.sp,
                      color: AppColors.darkColor,
                    ),
                  ),
                  TextField(
                    controller: firstNameControler,
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: 'enter your name',
                        border: UnderlineInputBorder()),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateHeight(20.sp),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last Name',
                    style: AppTextStyle.greetingStyle.copyWith(
                      fontSize: 17.sp,
                      color: AppColors.darkColor,
                    ),
                  ),
                  TextField(
                    controller: lastNameControler,
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: 'enter your name',
                        border: UnderlineInputBorder()),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateHeight(20.sp),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact no.',
                    style: AppTextStyle.greetingStyle.copyWith(
                      fontSize: 17.sp,
                      color: AppColors.darkColor,
                    ),
                  ),
                  TextField(
                    controller: contactControler,
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: 'enter your number',
                        border: UnderlineInputBorder()),
                  ),
                ],
              ),
              SizedBox(height: getHeight(context) * 0.5),
              Obx(
                () => controler.isLoading.value
                    ? CircularProgressIndicator(
                        color: Colors.amber,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: getWidth(context) * 0.4,
                            child: ElevatedButton(
                              onPressed: () {
                                // Add your onPressed logic here
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.amber, backgroundColor: Colors.white, // Text color
                                side: BorderSide(
                                    color: Colors.amber), // Border color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Border radius
                                ),
                              ),
                              child: Text('Cancle'),
                            ),
                          ),
                          SizedBox(
                              height: 20), // Add some space between buttons
                          SizedBox(
                            width: getWidth(context) * 0.4,
                            child: ElevatedButton(
                              onPressed: () {
                                controler.updateUserInfo(
                                    firstNameControler.text,
                                    lastNameControler.text,
                                    contactControler.text);
                                // Add your onPressed logic here
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.amber, // Background color
                                backgroundColor: Color(0xffFFB100), // Text color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Border radius
                                ),
                              ),
                              child: Text('Saved'),
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
