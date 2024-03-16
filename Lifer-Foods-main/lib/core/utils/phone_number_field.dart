// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
//
// import 'custom_buttons.dart';
//
// class CreatePhonePage extends StatefulWidget {
//   final bool isSignup;
//
//   const CreatePhonePage({Key? key, required this.isSignup}) : super(key: key);
//
//   @override
//   _CreatePhonePageState createState() => _CreatePhonePageState();
// }
//
// class _CreatePhonePageState extends State<CreatePhonePage> {
//   final phoneCont = TextEditingController();
//   final String forgetHeader = 'Forget Password!';
//   final String forgetMessage = 'Please enter your registered phone no.';
//   final String signupHeader = 'Setup New Account!';
//   final String signupMessage = 'Please enter your correct phone no.';
//   late PhoneNumber _phoneNumber;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.transparent,
//         elevation: 0,
//         child: Container(
//           height: 4,
//           color: Colors.grey,
//           margin: EdgeInsets.only(
//               left: getWidth(context) * .35,
//               right: getWidth(context) * .35),
//         ),
//       ),
//      // backgroundColor: bColor,
//       appBar: AppBar(
//         backgroundColor: bColor,
//         leading: IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(Icons.arrow_back, color: black)),
//         elevation: 0,
//       ),
//       body: ListView(
//         children: [
//           Container(
//               margin: EdgeInsets.symmetric(
//                 horizontal: getWidth(context) * .1,
//                 vertical: getHeight(context) * .08,
//               ),
//               child: Image.asset('assets/images/logo.png')),
//           Container(
//             margin: EdgeInsets.only(
//               left: getWidth(context) * .05,
//             ),
//             child: Text(
//               widget.isSignup ? signupHeader : forgetHeader,
//               style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(
//               left: getWidth(context) * .05,
//             ),
//             child: Text(
//               widget.isSignup ? signupMessage : forgetMessage,
//               style: const TextStyle(fontSize: 15, color: Colors.grey),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(
//                 left: getWidth(context) * .05,
//                 right: getWidth(context) * .05,
//                 top: getHeight(context) * .03),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: grey)),
//             child: InternationalPhoneNumberInput(
//               initialValue: PhoneNumber(isoCode: 'PK'),
//               textFieldController: phoneCont,
//               spaceBetweenSelectorAndTextField: 0,
//               selectorConfig: const SelectorConfig(
//                   selectorType: PhoneInputSelectorType.DIALOG,
//                   showFlags: true,
//                   leadingPadding: 5.0),
//               onInputChanged: (PhoneNumber value) {
//                 setState(() => _phoneNumber = value);
//               },
//               onSubmit: (){
//                 print(_phoneNumber.isoCode);
//                 print(_phoneNumber.dialCode);
//                 print(_phoneNumber.phoneNumber);
//                 print(_phoneNumber.parseNumber());
//                 FocusManager.instance.primaryFocus?.unfocus();
//               },
//               cursorColor: black,
//               inputDecoration: const InputDecoration(
//                   contentPadding: EdgeInsets.only(bottom: 15, left: 0),
//                   border: InputBorder.none,
//                   hintText: 'Phone Number'),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: getHeight(context) * .03),
//             child: CreateGradientButton(
//                 text: 'Proceed',
//                 onTap: () {
//                   if (phoneCont.text.isEmpty || phoneCont.text.length < 11) {
//                     showSnackbar(context, 'Please Enter Mobile Number First!');
//                   } else {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 ValidateOtp(isSignup: widget.isSignup)));
//                   }
//                 },
//                 width: getWidth(context) * .9),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: getHeight(context) * .03),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(
//                   widget.isSignup ? 4 : 3,
//                       (index) => Container(
//                     height: 10,
//                     width: 10,
//                     margin: const EdgeInsets.only(right: 5),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: index == 0
//                             ? Theme.of(context).primaryColor
//                             : grey),
//                   )),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }