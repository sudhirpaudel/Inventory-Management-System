import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventorymanagementsystem/models/client_model.dart';

createClient(ClientModel client) async {
  print(jsonEncode(client));
  var response = await http.post(Uri.parse('http://127.0.0.1:8000/client/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        "client_name": client.clientName,
        "client_type": client.clientType,
        "district": client.district,
        "province": client.province,
        "municipality": client.municipality,
        "ward_no": client.wardNo,
        "pan_number":client.panNumber,
        "manager_name": client.managerName,
        "manager_phone":client.managerPhone,
        "client_phone": client.clientPhone,
        "address":client.address,
        "email":client.email
      }));
  print(response.statusCode);
  print(response.body);
}
