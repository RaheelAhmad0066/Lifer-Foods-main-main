import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../presentation/screens/bottom_navigation/curved_bottom_navigation.dart';

class SocialAuth extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  Future<void> navigateToHomePage() async {
    Get.off(CurvedNavigationbar());
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      await navigateToHomePage(); // Navigate to home page after successful sign-in
    } catch (error) {
      Get.snackbar('Error', error.toString());
      print("Error signing in with Google: $error");
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await _facebookAuth.login();
      final AuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      await _auth.signInWithCredential(credential);
      await navigateToHomePage(); // Navigate to home page after successful sign-in
    } catch (error) {
      Get.snackbar('Error', error.toString());
      print("Error signing in with Facebook: $error");
    }
  }

  Future<void> signInWithApple() async {
    try {
      final AuthorizationCredentialAppleID appleCredential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final OAuthProvider oAuthProvider = OAuthProvider('apple.com');
      final AuthCredential credential = oAuthProvider.credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );
      await _auth.signInWithCredential(credential);
      await navigateToHomePage(); // Navigate to home page after successful sign-in
    } catch (error) {
      Get.snackbar('Error', error.toString());
      print("Error signing in with Apple: $error");
    }
  }
}
