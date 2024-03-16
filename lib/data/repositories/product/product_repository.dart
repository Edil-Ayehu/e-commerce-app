// Repository for managing product -related data and operations
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  // Firestore instance for database interactions.
  final _db = FirebaseFirestore.instance;

  // Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw 'Something went wrong. Please try again : $e';
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print("============================================================" +   e.toString());
      throw 'Something went wrong. Please try again $e';
      
    }
  }

  // Upload dummy data to the cloud Firebase
}
