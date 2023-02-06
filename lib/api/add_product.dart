import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventorymanagementsystem/models/product_model.dart';

createProduct(ProductModel product) async {
  print(jsonEncode(product));
  var response = await http.post(Uri.parse('http://127.0.0.1:8000/product/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        "client_name": product.clientName,
        "product_name": product.productName,
        "article_number": product.articleNumber,
        "color": product.color,
        "product_category": product.productCategory,
        "product_type": product.productType,
       
      }));
  print(response.statusCode);
  print(response.body);
}
