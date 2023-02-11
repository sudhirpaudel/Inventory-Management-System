// To parse this JSON data, do
//
//     final transactionMain = transactionMainFromJson(jsonString);

import 'dart:convert';

TransactionModel transactionMainFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));

String transactionMainToJson(TransactionModel data) =>
    json.encode(data.toJson());

class TransactionModel {
  TransactionModel({
    required this.clientName,
    required this.transactionDate,
    required this.transactionType,
    required this.numberOfProducts,
    required this.totalNumberOfProducts,
    required this.totalAmount,
     required this.needVat,
    required this.withVat,
    required this.productDetail,
  });

  String clientName;
  String transactionDate;
  String transactionType;
  int numberOfProducts;
  int totalNumberOfProducts;
  double totalAmount;
   bool needVat;
  bool withVat;
  
  List<ProductDetail> productDetail;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        clientName: json["client_name"],
        transactionDate: json["transaction_date"],
        transactionType: json["transaction_type"],
        numberOfProducts: json["number_of_products"],
        totalNumberOfProducts: json["total_number_of_products"],
        totalAmount: json["total_amount"]?.toDouble(),
        needVat: json["need_vat"],
        withVat: json["with_vat"],
        productDetail: List<ProductDetail>.from(
            json["product_detail"].map((x) => ProductDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "client_name": clientName,
        "transaction_date": transactionDate,
        "transaction_type": transactionType,
        "number_of_products": numberOfProducts,
        "total_number_of_products": totalNumberOfProducts,
        "total_amount": totalAmount,
        "need_vat": needVat,
        "with_vat": withVat,
        "product_detail":
            List<dynamic>.from(productDetail.map((x) => x.toJson())),
      };
}

class ProductDetail {
  ProductDetail({
    required this.productName,
    required this.numberOfProducts,
    this.numberOfSizes,
    required this.productPrice,
    this.sizeDetail,
  });

  String productName;
  int numberOfProducts;
  int? numberOfSizes;
  double productPrice;
  List<SizeDetail>? sizeDetail;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        productName: json["product_name"],
        numberOfProducts: json["number_of_products"],
        numberOfSizes: json["number_of_sizes"],
        
        productPrice: json["product_price"]?.toDouble(),
        sizeDetail: List<SizeDetail>.from(
            json["size_detail"].map((x) => SizeDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName,
        "number_of_products": numberOfProducts,
        "number_of_sizes": numberOfSizes,
        
        "product_price": productPrice,
        "size_detail": List<dynamic>.from(sizeDetail!.map((x) => x.toJson())),
      };
}

class SizeDetail {
  SizeDetail({
    required this.size,
    required this.numberOfProducts,
  });

  String size;
  int numberOfProducts;

  factory SizeDetail.fromJson(Map<String, dynamic> json) => SizeDetail(
        size: json["size"],
        numberOfProducts: json["number_of_products"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "number_of_products": numberOfProducts,
      };
}

OnlyTransactionModel onlyTransactionMainFromJson(String str) =>
    OnlyTransactionModel.fromJson(json.decode(str));

String onlyTransactionMainToJson(TransactionModel data) =>
    json.encode(data.toJson());

List<OnlyTransactionModel> onlyTransactionMainFromJsonList(String str) =>
    List<OnlyTransactionModel>.from(
        json.decode(str).map((x) => OnlyTransactionModel.fromJson(x)));

String onlyTransactionMainToJsonList(List<OnlyTransactionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OnlyTransactionModel {
  OnlyTransactionModel(
      {required this.id,
      required this.transactionDate,
      required this.transactionType,
      required this.numberOfProducts,
      required this.totalNumberOfProducts,
      required this.totalAmount,
      required this.client});

  int id;
  String transactionDate;
  String transactionType;
  int numberOfProducts;
  int totalNumberOfProducts;
  double totalAmount;
  Client client;

  factory OnlyTransactionModel.fromJson(Map<String, dynamic> json) =>
      OnlyTransactionModel(
        id: json["id"],
        transactionDate: json["transaction_date"],
        transactionType: json["transaction_type"],
        numberOfProducts: json["number_of_products"],
        totalNumberOfProducts: json["total_number_of_products"],
        totalAmount: json["total_amount"]?.toDouble(),
        client: Client.fromJson(json["client"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "transaction_date": transactionDate,
        "transaction_type": transactionType,
        "number_of_products": numberOfProducts,
        "total_number_of_products": totalNumberOfProducts,
        "total_amount": totalAmount,
        "client": client.toJson(),
      };
}

class Client {
  Client({
    required this.id,
    required this.clientName,
    required this.panNumber,
  });

  int id;
  String clientName;
  String panNumber;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        clientName: json["client_name"],
        panNumber: json["pan_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "client_name": clientName,
        "pan_number": panNumber,
      };
}
