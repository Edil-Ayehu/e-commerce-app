import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/images/t_circular_image.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image_strings.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                      image: TImages.user,
                      width: 100,
                      height: 100,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              // Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Heading Profile Info
              const TSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'Name',value: 'Edilayehu T',onPressed: (){}),
              TProfileMenu(title: 'Username',value: 'Edil',onPressed: (){}),

              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Heading Personal Info

              const TSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'User ID',value: '835',icon: Iconsax.copy, onPressed: (){}),
              TProfileMenu(title: 'E-mail',value: 'edil@gmail.com',onPressed: (){}),
              TProfileMenu(title: 'Phone Number',value: '+251911223344',onPressed: (){}),
              TProfileMenu(title: 'Gender',value: 'Male',onPressed: (){}),
              TProfileMenu(title: 'Date of Birth',value: '10 Oct 1980',onPressed: (){}),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(child: TextButton(onPressed: (){}, child: const Text('Close Account',style: TextStyle(color: Colors.red),)))
            ],
          ),
        ),
      ),
    );
  }
}

