import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/ratings/rating_indicator.dart';
import 'widgets/rating_progress_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // Appbar
      appBar: const TAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Rating and reviews are verified and are from people who use the same tye of device that you use.'),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Overall Product Ratings
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 4.2),
              Text('12,232',style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              // User Reviews List 
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}






