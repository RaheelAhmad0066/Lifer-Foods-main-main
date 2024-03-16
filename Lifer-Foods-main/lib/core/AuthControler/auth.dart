import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'dart:convert';
import 'package:lifer_food/constant/constants.dart';
import 'package:lifer_food/core/utils/PrefUtils.dart';
import 'package:lifer_food/model/user_info_modal.dart';

import '../../presentation/screens/auth_pages/signup/signup_componants/validate_otp.dart';
import '../../presentation/screens/bottom_navigation/curved_bottom_navigation.dart';

class AuthService extends GetxController {
  final nameController = TextEditingController();
  final lastnameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  PhoneNumber selectedCodeNumber = PhoneNumber();
  RxBool isLoading = false.obs; // Track loading state
  String token = Get.find<PrefUtils>().getString('userToken') ?? '';
  final userId = Get.find<PrefUtils>().getString('userId');
  var userdata = UserData(
      id: 0, roleId: 0, firstName: '', lastName: '', email: '', contactNo: '');
  @override
  void onInit() {
    // TODO: implement onInit
    getUserData();
    super.onInit();
  }

  void signUp() async {
    final String phonecont = phoneNumberController.text;
    isLoading.value = true;
    update();
    var data = {
      "role_id": 2,
      "first_name": nameController.text,
      "last_name": lastnameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "contact_no": "${selectedCodeNumber.dialCode}$phonecont"
    };
    var response = await http.post(
      Uri.parse(signup),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 201) {
      var jsonResponse = json.decode(response.body);
      Get.offAll(ValidateOtp());
      Get.snackbar('Success', 'Registration Successful');
      print(jsonResponse['message'].toString());
    } else {
      Get.snackbar('Error', json.decode(response.body)['message']);
    }
    isLoading.value = false;
  }

  void signIn() async {
    isLoading.value = true;
    print(token);
    var data = {
      'email': emailController.text,
      'password': passwordController.text
    };
    var response = await http.post(
      Uri.parse(login),
      body: jsonEncode(data),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse['success'] == true) {
        var userdata = jsonResponse['data'];
        var userToken = userdata['token'];
        Get.find<PrefUtils>().setString('userToken', userToken);
        Get.offAll(CurvedNavigationbar());
        Get.snackbar('Success', 'Sign In Successful');
      } else {
        Get.snackbar('Error', json.decode(response.body)['message']);
      }
    }
    isLoading.value = false;
  }

  void forgetPassword() async {
    isLoading.value = true;
    var data = {'email': emailController.text};
    var resPonce = await http.post(
      Uri.parse(forgetpassword),
      body: jsonEncode(data),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (resPonce.statusCode == 200) {
      var jsonresPonce = json.decode(resPonce.body);
      if (jsonresPonce['success'] == true) {
        Get.back();
        Get.snackbar('Success', 'Password is change successfuly');
      } else {
        Get.snackbar('Error', json.decode(resPonce.body)['message']);
      }
    }
    isLoading.value = false;
  }

  void verifyEmail(String otp) async {
    try {
      isLoading.value = true;
      update();
      print(userId.toString());
      var data = {'otp': otp, 'email': emailController.text};
      var resPonce = await http.post(Uri.parse(verifyemail),
          body: jsonEncode(data),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      if (resPonce.statusCode == 200) {
        var jsonrespnce = jsonDecode(resPonce.body);
        var userdata = jsonrespnce['data'];
        var userId = userdata['id'];
        // preferences.setBool('user', userId);
        // preferences.setString('userId', userId);
        print(userId);
        Get.offAll(CurvedNavigationbar());
        Get.snackbar('Otp', 'Otp is sending');
      } else {
        Get.snackbar('Error', json.decode(resPonce.body)['message']);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void updateUserInfo(String firstName, lastName, contactNo) async {
    try {
      isLoading.value = true;
      var data = {
        "id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "contact_no": contactNo
      };
      var resPonce = await http.put(Uri.parse('$userinfo$userId'),
          body: jsonEncode(data),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      if (resPonce.statusCode == 200) {
        var jsonresPonce = jsonDecode(resPonce.body);
        firstName = jsonresPonce['first_name'];
        lastName = jsonresPonce['last_name'];
        contactNo = jsonresPonce['contact_no'];
        if (jsonresPonce['success'] == true) {
          Get.snackbar('Success', 'Profile is updated');
        } else {
          Get.snackbar('Error', jsonresPonce['message'].toString());
        }
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  int id = 1;

  Future<void> getUserData() async {
    final resPonce = await http.get(
      Uri.parse('$userinfo$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    if (resPonce.statusCode == 200) {
      final Map<String,dynamic>  userData = jsonDecode(resPonce.body);
      userdata=UserData.fromJson(userData['data']);
    } else {
      throw throw Exception('Failed to load user data');
    }
  }
}
