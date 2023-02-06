// To parse this JSON data, do
//
//     final transactionMain = transactionMainFromJson(jsonString);

import 'dart:convert';

TransactionModel transactionMainFromJson(String str) => TransactionModel.fromJson(json.decode(str));

String transactionMainToJson(TransactionModel data) => json.encode(data.toJson());

class TransactionModel {
    TransactionModel({
        required this.company,
        required this.transactionDate,
        required this.transactionType,
        required this.numberOfProducts,
        required this.totalNumberOfProducts,
        required this.totalAmount,
        required this.productDetail,
    });

    String company;
    String transactionDate;
    String transactionType;
    int numberOfProducts;
    int totalNumberOfProducts;
    double totalAmount;
    List<ProductDetail> productDetail;

    factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        company: json["company"],
        transactionDate: json["transaction_date"],
        transactionType: json["transaction_type"],
        numberOfProducts: json["number_of_products"],
        totalNumberOfProducts: json["total_number_of_products"],
        totalAmount: json["total_amount"]?.toDouble(),
        productDetail: List<ProductDetail>.from(json["product_detail"].map((x) => ProductDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "company": company,
        "transaction_date": transactionDate,
        "transaction_type": transactionType,
        "number_of_products": numberOfProducts,
        "total_number_of_products": totalNumberOfProducts,
        "total_amount": totalAmount,
        "product_detail": List<dynamic>.from(productDetail.map((x) => x.toJson())),
    };
}

class ProductDetail {
    ProductDetail({
        required this.id,
        required this.numberOfProducts,
        this.numberOfSizes,
        required this.needVat,
        required this.withVat,
        required this.productPrice,
        this.sizeDetail,
    });

    int id;
    int numberOfProducts;
    int? numberOfSizes;
    bool needVat;
    bool withVat;
    double productPrice;
    List<SizeDetail>? sizeDetail;

    factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["id"],
        numberOfProducts: json["number_of_products"],
        numberOfSizes: json["number_of_sizes"],
        needVat: json["need_vat"],
        withVat: json["with_vat"],
        productPrice: json["product_price"]?.toDouble(),
        sizeDetail: List<SizeDetail>.from(json["size_detail"].map((x) => SizeDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "number_of_products": numberOfProducts,
        "number_of_sizes": numberOfSizes,
        "need_vat": needVat,
        "with_vat": withVat,
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
