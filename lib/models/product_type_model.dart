// To parse this JSON data, do
//
//     final productTypeModel = productTypeModelFromJson(jsonString);

import 'dart:convert';

ProductTypeModel productTypeModelFromJson(String str) => ProductTypeModel.fromJson(json.decode(str));

String productTypeModelToJson(ProductTypeModel data) => json.encode(data.toJson());

class ProductTypeModel {
    ProductTypeModel({
        required this.productType,
    });

    String productType;

    factory ProductTypeModel.fromJson(Map<String, dynamic> json) => ProductTypeModel(
        productType: json["product_type"],
    );

    Map<String, dynamic> toJson() => {
        "product_type": productType,
    };
}
