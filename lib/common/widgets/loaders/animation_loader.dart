import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  // Default constructor for the TAnimationLoaderWidget
  ///
  /// Parameters:
  /// - text: The text to be displayed below the animation
  /// - animation:  The path to the lottie animation file.
  /// - showAction: Whether to show an action button below the text
  /// - actionText: The text to be displayed on the action button
  /// - onActionPressed: Callback function to be executed when the action button is pressed
  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed, 
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8), // Display lottie animation
          const SizedBox(height: TSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.defaultSpace),
          showAction? SizedBox(
            width: 250,
            child: OutlinedButton(
              onPressed: onActionPressed,
              style: OutlinedButton.styleFrom(backgroundColor: TColors.dark),
              child: Text(
                actionText!,style: const TextStyle(color: Colors.white),
              ),
            ),
            )
            : const SizedBox(),
        ],
      ),
    );
  }
}
