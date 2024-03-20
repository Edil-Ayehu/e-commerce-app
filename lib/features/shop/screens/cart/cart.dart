import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: TAppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: Obx(() {  
        // Nothing Found Widget
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Whoops! Cart is Empty.',
          animation: TImages.emptyWishlist,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(
            () => const NavigationMenu(),
          ),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else{
          return const SingleChildScrollView(
            child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: TCartItems(),
                    ),
          );
        }
        
      }),
      bottomNavigationBar: Obx(
        ()=> controller.cartItems.isEmpty ?
         const SizedBox():
         Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: Obx(()=> Text("Checkout \$${controller.totalCartPrice.value}")),
          ),
        ),
      ),
    );
  }
}
