// Repository for managing product -related data and operations
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_exceptions.dart';
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
          .where('IsFeatured', isEqualTo: true).limit(4)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw 'Something went wrong. Please try again : $e';
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again $e';
    }
  }

    // Get all featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
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
      throw 'Something went wrong. Please try again $e';
    }
  }

  // Get products based on the brand
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapShot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw 'Something went wrong. Please try again : $e';
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again $e';
    }
  }


    Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async {
    try {
      if (productIds.isEmpty) {
        return []; // Return an empty list if productIds is empty
    }
      final snapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
      return snapshot.docs.map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again $e';
    }
  }

  //
  Future<List<ProductModel>> getProductsForBrand({required String brandId,int limit = -1})async{
  try{
    final querySnapshot = limit == -1
    ? await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).get()
    : await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).limit(limit).get();

    final products = querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

    return products;

  }on FirebaseException catch (e) {
      throw 'Something went wrong. Please try again : $e';
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again $e';
    }
  }


  Future<List<ProductModel>> getProductsForCategory({required String categoryId,int limit = 4})async{
  try{
    QuerySnapshot productCategoryQuery = limit == -1
    ? await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).get()
    : await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).limit(limit).get();

    // Extract productIds from the documents
    List<String> productIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();
    if (productIds.isEmpty) {
        return []; // Return an empty list if productIds is empty
    }

    final productsQuery = await _db.collection('Products').where(FieldPath.documentId,whereIn: productIds).get();

    List<ProductModel> products = productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    
      return products;
    

  }on FirebaseException catch (e) {
      throw 'Something went wrong. Please try again : $e';
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw '=============Something went wrong. Please try again $e';
    }
  }

  // Upload dummy data to the cloud Firebase
}
