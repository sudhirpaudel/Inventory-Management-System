// To parse this JSON data, do
//
//     final showTransaction = showTransactionFromJson(jsonString);

import 'dart:convert';

ShowTransaction showTransactionFromJson(String str) => ShowTransaction.fromJson(json.decode(str));

String showTransactionToJson(ShowTransaction data) => json.encode(data.toJson());

class ShowTransaction {
    ShowTransaction({
        required this.transaction,
        required this.products,
    });

    Transaction transaction;
    List<ProductElement> products;

    factory ShowTransaction.fromJson(Map<String, dynamic> json) => ShowTransaction(
        transaction: Transaction.fromJson(json["transaction"]),
        products: List<ProductElement>.from(json["products"].map((x) => ProductElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "transaction": transaction.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class ProductElement {
    ProductElement({
        required this.product,
        required this.sizes,
    });

    ProductProduct product;
    List<Size> sizes;

    factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        product: ProductProduct.fromJson(json["product"]),
        sizes: List<Size>.from(json["sizes"].map((x) => Size.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "sizes": List<dynamic>.from(sizes.map((x) => x.toJson())),
    };
}

class ProductProduct {
    ProductProduct({
        required this.id,
        required this.numberOfProducts,
        this.numberOfSizes,
        required this.needVat,
        required this.withVat,
        required this.productPrice,
        required this.transaction,
        required this.product,
    });

    int id;
    int numberOfProducts;
    dynamic numberOfSizes;
    bool needVat;
    bool withVat;
    int productPrice;
    int transaction;
    int product;

    factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
        id: json["id"],
        numberOfProducts: json["number_of_products"],
        numberOfSizes: json["number_of_sizes"],
        needVat: json["need_vat"],
        withVat: json["with_vat"],
        productPrice: json["product_price"],
        transaction: json["transaction"],
        product: json["product"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "number_of_products": numberOfProducts,
        "number_of_sizes": numberOfSizes,
        "need_vat": needVat,
        "with_vat": withVat,
        "product_price": productPrice,
        "transaction": transaction,
        "product": product,
    };
}

class Size {
    Size({
        required this.id,
        required this.size,
        required this.numberOfProducts,
        required this.transaction,
        required this.product,
    });

    int id;
    String size;
    int numberOfProducts;
    int transaction;
    int product;

    factory Size.fromJson(Map<String, dynamic> json) => Size(
        id: json["id"],
        size: json["size"],
        numberOfProducts: json["number_of_products"],
        transaction: json["transaction"],
        product: json["product"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "size": size,
        "number_of_products": numberOfProducts,
        "transaction": transaction,
        "product": product,
    };
}

class Transaction {
    Transaction({
        required this.id,
        required this.transactionDate,
        required this.numberOfProducts,
        required this.totalNumberOfProducts,
        required this.totalAmount,
        required this.transactionType,
        required this.client,
    });

    int id;
    DateTime transactionDate;
    int numberOfProducts;
    int totalNumberOfProducts;
    int totalAmount;
    String transactionType;
    Client client;

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        transactionDate: DateTime.parse(json["transaction_date"]),
        numberOfProducts: json["number_of_products"],
        totalNumberOfProducts: json["total_number_of_products"],
        totalAmount: json["total_amount"],
        transactionType: json["transaction_type"],
        client: Client.fromJson(json["client"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "transaction_date": transactionDate.toIso8601String(),
        "number_of_products": numberOfProducts,
        "total_number_of_products": totalNumberOfProducts,
        "total_amount": totalAmount,
        "transaction_type": transactionType,
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