import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/loaders/animation_loader.dart';

// A utility class for managing a full - screen loading dialog

class TFullScreenLoader {
  // Open a full-screen loading dialog with a given text & animation
  // This method doesn't return anything
  //
  /// Parameters:
  /// -text : The text to be displayed in the loading dialog
  /// -animation: the lattie animation to be shown
  ///

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context:
          Get.overlayContext!, // user Get.overlayContext for overlay dialogs
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!)
        .pop(); // Close the dialog using the Navigator
  }
}
