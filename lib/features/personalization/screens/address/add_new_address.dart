import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Add New Address'),showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(child: Column(
            children: [
              TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name')),
              const SizedBox(height: TSizes.spaceBtwFields),
              TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number')),
              const SizedBox(height: TSizes.spaceBtwFields),
              Row(
                children: [
                  Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street'))),
                  const SizedBox(width: TSizes.spaceBtwFields),
                  Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code'))),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwFields),
              Row(
                children: [
                  Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'))),
                  const SizedBox(width: TSizes.spaceBtwFields),
                  Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'Region'))),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwFields),
              TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country')),
              const SizedBox(height: TSizes.defaultSpace),
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Save'))),
            ],
          )),
        ),
      ),
    );
  }
}