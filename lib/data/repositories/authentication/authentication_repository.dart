import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local storage

      deviceStorage.writeIfNull('IsFirstTime', true);
      // Check if it's the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  /* ---------------------Email & Password sign in ------------------ */

  // [EmailAuthentication]- signIn

  // [EmailAuthentication]- Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw 'Something went wrong. Please try again';
    } on FirebaseException catch (e) {
      throw 'Something went wrong. Please try again';
    } on FormatException catch (e) {
      throw 'Something went wrong. Please try again';
    } on PlatformException catch (e) {
      throw 'Something went wrong. Please try again';
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // [EmailAuthentication]- ReAuthenticate User
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw 'Something went wrong. Please try again';
    } on FirebaseException catch (e) {
      throw 'Something went wrong. Please try again';
    } on FormatException catch (e) {
      throw 'Something went wrong. Please try again';
    } on PlatformException catch (e) {
      throw 'Something went wrong. Please try again';
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // [EmailAuthentication]- Mail Verification

  // [EmailAuthentication]- Forget Password

  /* ---------------------Federated identity & Social sign in ------------------ */

  // [GoogleAuthentication]- Google

  // [FacebookAuthentication]- Facebook

  /* ---------------------./ end Federated identity & social sign in ------------------ */

  // [LogoutUser]- Valid for any authentication
  Future<void> logout()async {
    try{
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=> const LoginScreen());
    }on FirebaseAuthException catch (e) {
      throw 'Something went wrong. Please try again';
    } on FirebaseException catch (e) {
      throw 'Something went wrong. Please try again';
    } on FormatException catch (e) {
      throw 'Something went wrong. Please try again';
    } on PlatformException catch (e) {
      throw 'Something went wrong. Please try again';
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Delete User- Remove user auth & Firestore Account
}
