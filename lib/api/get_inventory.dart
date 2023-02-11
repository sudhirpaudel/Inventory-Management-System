import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventorymanagementsystem/models/inventory_model.dart';

getInventory() async {
  var response = await http.get(
    Uri.parse('http://127.0.0.1:8000/inventory'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print(response.body);
  print(response.statusCode);
  return inventoryFromJson(response.body);
}
