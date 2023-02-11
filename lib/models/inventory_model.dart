// To parse this JSON data, do
//
//     final inventory = inventoryFromJson(jsonString);

import 'dart:convert';

List<InventoryModel> inventoryFromJson(String str) => List<InventoryModel>.from(json.decode(str).map((x) => InventoryModel.fromJson(x)));

String inventoryToJson(List<InventoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InventoryModel {
    InventoryModel({
        required this.id,
        required this.product,
        required this.numberOfProducts,
    });

    int id;
    int product;
    int numberOfProducts;

    factory InventoryModel.fromJson(Map<String, dynamic> json) => InventoryModel(
        id: json["id"],
        product: json["product"],
        numberOfProducts: json["number_of_products"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product": product,
        "number_of_products": numberOfProducts,
    };
}
