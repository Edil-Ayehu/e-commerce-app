import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/product_cards/product_card_horizontal.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Sports Shirts'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column( 
            children: [
              // Banner 

              const TRoundedImage(imageUrl: TImages.promoBanner1,applyImageRadius: true,width: double.infinity),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Sub Categories
              Column(
                children: [
                  // Heading
                  TSectionHeading(title: 'Sport Shoes', onPressed:(){}),
                  const SizedBox(height: TSizes.spaceBtwItems/2),

                  
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                       itemCount: 6,
                       scrollDirection: Axis.horizontal,
                       separatorBuilder: (context,index)=> const SizedBox(width: TSizes.spaceBtwItems,),
                        itemBuilder: (context,index)=> const TProductCardHorizontal(),
                        ),
                  ),
                ],
              ),

              Column(
                children: [
                  // Heading
                  TSectionHeading(title: 'Sports Equipments', onPressed:(){}),
                  const SizedBox(height: TSizes.spaceBtwItems/2),

                  
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                       itemCount: 6,
                       scrollDirection: Axis.horizontal,
                       separatorBuilder: (context,index)=> const SizedBox(width: TSizes.spaceBtwItems,),
                        itemBuilder: (context,index)=> const TProductCardHorizontal(),
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}