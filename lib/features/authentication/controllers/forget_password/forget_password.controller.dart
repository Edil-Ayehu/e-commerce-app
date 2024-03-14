import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/network_manager.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/password_configuration/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog(
          'Processing your request, please wait', TImages.loadAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // show Success Screen
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);

      // redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));


    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
        try {
      // Start loading
      TFullScreenLoader.openLoadingDialog(
          'Processing your request, please wait', TImages.loadAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }


      // Send Email to Reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // show Success Screen
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);

      
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
