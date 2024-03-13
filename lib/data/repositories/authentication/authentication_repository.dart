import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();

  // Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show relevant screen
  screenRedirect() async {
    // Local storage
    
    deviceStorage.writeIfNull('IsFirstTime', true);

    if (kDebugMode) {
      print('==================================== Get Storage Auth Repo ===========');
      print(deviceStorage.read('IsFirstTime'));
    }
    
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  /* ---------------------Email & Password sign in ------------------ */

  // [EmailAuthentication]- signIn

  // [EmailAuthentication]- Register

  // [EmailAuthentication]- ReAuthenticate User

  // [EmailAuthentication]- Mail Verification

  // [EmailAuthentication]- Forget Password

  /* ---------------------Federated identity & Social sign in ------------------ */

  // [GoogleAuthentication]- Google

  // [FacebookAuthentication]- Facebook

  /* ---------------------./ end Federated identity & social sign in ------------------ */

  // [LogoutUser]- Valid for any authentication

  // Delete User- Remove user auth & Firestore Account
}
