import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventorymanagementsystem/models/product_model.dart';

getProducts() async {
  var response = await http.get(
    Uri.parse('http://127.0.0.1:8000/product'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print(response.body);
  print(response.statusCode);
  return productsFromJson(response.body);
}
