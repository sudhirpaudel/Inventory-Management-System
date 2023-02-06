import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventorymanagementsystem/models/client_model.dart';

 getClients() async {
  var response = await http.get(
    Uri.parse('http://127.0.0.1:8000/client'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print(response.body);
 

  return  clientsFromJson(response.body);
}
