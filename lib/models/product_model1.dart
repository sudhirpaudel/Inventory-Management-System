import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel1 {
  final String productId;
  final String articleNo;
  final String category;
  final String color;
  final String version;
  final String company;
  final String imageUrl;
  final List sizes;
  final DateTime dateTime;

  const ProductModel1(
    {
    required  this.productId,
    required  this.articleNo,
    required  this.category,
    required  this.color,
    required  this.version,
    required  this.company,
    required  this.imageUrl,
    required  this.sizes,
    required  this.dateTime,
  }
  );

  static ProductModel1 fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ProductModel1(
        productId: snapshot['productId'],
        articleNo: snapshot['articleNo'],
        category: snapshot['category'],
        color: snapshot['color'],
        version: snapshot['version'],
        imageUrl: snapshot['imageUrl'],
        company: snapshot['company'],
       sizes: snapshot['sizes'],
        dateTime: snapshot['dateTime'],
        );
  }

  Map<String, dynamic> toJson() => {
       "productId":productId,
       "articleNo":articleNo,
       "category":category,
       "color":color,
       "version":version,
       "company":company,
       "imageUrl":imageUrl,
       "sizes":sizes,
       "dateTime":dateTime,
      };
}
