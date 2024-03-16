import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/category_model.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Brands
              const TBrandShowCase(
                images: [
                  TImages.productImage5,
                  TImages.productImage6,
                  TImages.productImage7
                ],
              ),
              const TBrandShowCase(
                images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage4
                ],
              ),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Products
              TSectionHeading(title: 'You might like', onPressed: () {}),
              const SizedBox(height: TSizes.spaceBtwItems),

              TGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => TProductCardVertical(product: ProductModel.empty())),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
