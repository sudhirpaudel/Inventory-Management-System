import 'dart:convert';

List<ProductModel> productsFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productsToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    required this.productName,
    required this.clientName,
    this.articleNumber,
    this.color,
    this.productType,
    this.productCategory,
   
  });

  String productName;
  String clientName;
  String? articleNumber;
  String? color;
  String? productType;
  String? productCategory;
 
  // List<String>? availableSizes;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productName: json["product_name"],
        clientName: json["client_id"],
        articleNumber: json["article_number"],
        color: json["color"],
        productType: json["product_type"],
        productCategory: json["product_category"],
       
        //  availableSizes: List<String>.from(json["available_sizes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName,
        "client_id": clientName,
        "article_number": articleNumber,
        "color": color,
        "product_type": productType,
        "product_category": productCategory,
       
        //  "available_sizes": List<dynamic>.from(availableSizes!.map((x) => x)),
      };
}
