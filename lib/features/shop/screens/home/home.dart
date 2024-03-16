import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/shimmers/vertical_shimmer.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  THomeAppBar(),

                  SizedBox(height: TSizes.spaceBtwSections),

                  // Searchbar
                  TSearchContainer(
                    text: "Search in Store",
                  ),

                  SizedBox(height: TSizes.spaceBtwSections),

                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        // Heading
                        TSectionHeading(
                          title: "Popular Categories",
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),

                        // Categories
                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // Promo Slider
                  const TPromoSlider(),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Heading
                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),

                  // Popular Products
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const TVerticalProductShimmer();
                    }

                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text(
                          'No Data Found!   ljlakjdflajd',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }

                    return TGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) => TProductCardVertical(product: controller.featuredProducts[index],),
                      );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
