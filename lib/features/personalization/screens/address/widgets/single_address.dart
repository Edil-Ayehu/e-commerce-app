import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(TSizes.md),
      backgroundColor: selectedAddress ? Colors.lightBlueAccent.withOpacity(0.5): Colors.transparent,
      borderColor: selectedAddress? Colors.transparent :  dark? TColors.darkerGrey: TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(selectedAddress ? Iconsax.tick_circle5: null,
            color: selectedAddress? dark? TColors.light: TColors.dark: null,
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
                  'Edilayehu T',
                   maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: TSizes.sm),
                const Text('+251930884402', maxLines: 1,overflow: TextOverflow.ellipsis),
                const SizedBox(height: TSizes.sm),
                const Text('Piasa, Addis Ababa , Ethiopia', softWrap: true),
            ],
          ),
        ],
      ),
    );
  }
}
