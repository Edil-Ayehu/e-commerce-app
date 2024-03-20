import 'package:e_commerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) =>
            const SizedBox(height: TSizes.spaceBtwSections),
        itemCount: cartController.cartItems.length,
        itemBuilder: (_, index) => Obx(
          () {
            final item = cartController.cartItems[index];
            return Column(
              children: [
                TCartItem(cartItem: item),

                if (showAddRemoveButtons)
                  const SizedBox(width: TSizes.spaceBtwItems),

                // Add remove Button Row with total Price
                if (showAddRemoveButtons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Extra space
                          const SizedBox(width: 70),
                          // Add Remove Buttons
                          TProductQuantityWithAddRemoveButton(
                            quantity: item.quantity,
                            add: () => cartController.addOneToCart(item),
                            remove: () => cartController.removeOneFromCart(item),
                          ),
                        ],
                      ),
                      TProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                    ],
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
