import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/models/payment_method_model.dart';
import 'package:e_commerce_app/features/shop/screens/order/widgets/payment_tile.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(image: TImages.telebirr, name: "Telebirr");
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context){
    return showModalBottomSheet(context: context, builder: (_)=>
    SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(TSizes.lg),
        child :Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Select Payment Method', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwSections),
            TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Telebirr', image: TImages.telebirr)),
            const SizedBox(height: TSizes.spaceBtwItems/2),
            TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Chapa', image: TImages.chapa)),
            const SizedBox(height: TSizes.spaceBtwItems/2),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    ),
    );
  }
}
