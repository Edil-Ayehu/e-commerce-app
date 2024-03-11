import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_text_with_verified_icon.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        // Image
        TRoundedImage(
          imageUrl: TImages.productImage4,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor:
              dark ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
    
        // Title, Price, & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Jordan'),
              const Flexible(child: TProductTitleText(title: 'Red Sports Shoes')),
          
              // Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Color:', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: ' Red ', style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: '     Size:', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: ' UK 08', style: Theme.of(context).textTheme.bodyLarge),
                  ]
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}