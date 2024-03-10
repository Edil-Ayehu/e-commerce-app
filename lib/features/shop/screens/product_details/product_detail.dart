import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import 'widgets/bottom_add_to_cart_widget.dart';
import 'widgets/product_detail_image_slider.dart';
import 'widgets/product_meta_data.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image Slider
            const TProductImageSlider(),

            // Product Details
            Padding(padding: const EdgeInsets.only(right: TSizes.defaultSpace,left: TSizes.defaultSpace,bottom: TSizes.defaultSpace),
            child: Column(
              children: [
                // Rating & Share 
                const TRatingAndShare(),


                // Price, Title, Stack & Brand
                const TProductMetaData(),

                // Attributes
                const TProductAttributes(), 
                const SizedBox(height: TSizes.spaceBtwSections),

                // Checkout Button
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text("Checkout"))),
                const SizedBox(height: TSizes.spaceBtwSections),

                // Description
                const TSectionHeading(title: 'Description',showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                const ReadMoreText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' Less',
                  moreStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),
                  lessStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),
                ),

                // Reviews
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TSectionHeading(title: 'Reviews (199)',showActionButton: false),
                    IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_3,size: 18,))
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}




