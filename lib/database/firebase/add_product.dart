// ignore_for_file: unused_import, unused_local_variable, prefer_final_fields

import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:inventorymanagementsystem/database/firebase/add_photo.dart';
import 'package:inventorymanagementsystem/models/product_model1.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_database/firebase_database.dart';

class ProductDatabaseManager {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _res = "Error Occured";
  String _photoUrl = "";
  Future<String> saveProduct({
    required String articleNo,
    required String category,
    required String color,
    required String version,
    required String company,
    //required Uint8List img,
    //required bool isImageNull,
    required List sizes,
  }) async {
    try {
      if (articleNo.isNotEmpty) {
        String productId = company[0] + articleNo + category[1]+color[0] + color[1];
        ProductModel1 product = ProductModel1(
            productId: productId,
            articleNo: articleNo,
            category: category,
            color: color,
            version: version,
            company: company,
            imageUrl: _photoUrl,
            sizes: sizes,
            dateTime: DateTime.now());
        _firestore.collection('Products').doc(productId).set(product.toJson());
        _res = "success";
      }
    } catch (err) {
      _res = err.toString();
    }
    return _res;
  }
}
