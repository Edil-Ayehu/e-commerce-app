import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // Get Authenticated User Data
  User? get authUser => _auth.currentUser;

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
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      //throw TFirebaseAuthException(e.code).message;
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

  // [EmailAuthentication]- Mail Verification
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
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // [EmailAuthentication]- ReAuthenticate User
  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      // Create a credential
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      // ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw 'Something went wrong. Please try again';
    } on FirebaseException catch (e) {
      throw 'Something went wrong. Please try again';
    } on FormatException catch (e) {
      throw 'Something went wrong. Please try again';
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // [EmailAuthentication]- Forget Password

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw 'Something went wrong. Please try again';
    } on FirebaseException catch (e) {
      throw 'Something went wrong. Please try again';
    } on FormatException catch (e) {
      throw 'Something went wrong. Please try again';
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /* ---------------------Federated identity & Social sign in ------------------ */

  // [GoogleAuthentication]- Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw 'Something went wrong. Please try again $e';
    } on FirebaseException catch (e) {
      throw 'Something went wrong. Please try again $e';
    } on FormatException catch (e) {
      throw 'Something went wrong. Please try again $e';
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

  // [FacebookAuthentication]- Facebook

  /* ---------------------./ end Federated identity & social sign in ------------------ */

  // [LogoutUser]- Valid for any authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw 'Something went wrong. Please try again';
    } on FirebaseException catch (e) {
      throw 'Something went wrong. Please try again';
    } on FormatException catch (e) {
      throw 'Something went wrong. Please try again';
    } on PlatformException catch (e) {
      throw throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Delete User- Remove user auth & Firestore Account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw 'Something went wrong. Please try again';
    } on FirebaseException catch (e) {
      throw 'Something went wrong. Please try again';
    } on FormatException catch (e) {
      throw 'Something went wrong. Please try again';
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
