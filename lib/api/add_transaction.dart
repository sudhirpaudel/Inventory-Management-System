import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventorymanagementsystem/models/transaction_model.dart';

createTransaction(TransactionModel transactionModel) async {
  print('object');
  print(jsonEncode(transactionModel));
  var response =
      await http.post(Uri.parse('http://127.0.0.1:8000/transaction'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body:json.encode(transactionModel));
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
