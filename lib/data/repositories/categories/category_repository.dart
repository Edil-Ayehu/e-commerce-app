import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // Varialble
  final _db = FirebaseFirestore.instance;

  // Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw 'Something went wrong. Please try again';
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Get sub Categories

  // Upload Categories to the Cloud Firebase
  // Future<void> uploadDummyData(List<CategoryModel> categories) async {
  //   try {
  //     // Upload all the categories along with their images
  //     final storage = Get.put(TFirebaseStorageService());

  //     // Loop through each category
  //     for (var category in categories) {
  //       //get ImageData link from the local assets
  //       final file = await storage.getImageDataFromAssets(category.image);

  //       // upload image and get its URL
  //       final url =
  //           await storage.uploadImageData("Categories", file, category.name);
  //       // assign URL to Category image attribute

  //       category.image = url;

  //       // store Category in Firestore
  //       await _db
  //           .collection('Categories')
  //           .doc(category.id)
  //           .set(category.toJson());
  //     }
  //   } on FirebaseException catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }
}
