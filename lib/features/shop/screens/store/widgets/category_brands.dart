import 'package:e_commerce_app/common/widgets/shimmers/boxes_shimmer.dart';
import 'package:e_commerce_app/common/widgets/shimmers/list_tile_shimmer.dart';
import 'package:e_commerce_app/features/shop/controllers/brand_controller.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper.functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {

          // Handle Loader, NO Record , Or Error Message
          const loader = Column(
            children: [
              TListTileShimmer(),
              SizedBox(height: TSizes.spaceBtwItems),
              TBoxesShimmer(),
              SizedBox(height: TSizes.spaceBtwItems),
            ],
          );
          final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
          if(widget != null) return widget;

          // Record found! 
          final brands = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_,index){
              final brand = brands[index];
              return FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id,limit: 3),
                builder: (context, snapshot) {

                  // Handle loader , No Record or Error Message
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                  if(widget != null) return widget;

                  // Record Found!
                  final products = snapshot.data!;
                  return TBrandShowCase(brand: brand, images: products.map((e) => e.thumbnail).toList());
                }
              );
            },
            );

          
        });
  }
}
