import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventorymanagementsystem/models/show_transaction.dart';
import 'package:inventorymanagementsystem/models/transaction_model.dart';

getSingleTransactions(int id) async {
  var response = await http.get(
    Uri.parse('http://127.0.0.1:8000/transaction/alldetails/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print(response.body);
  return showTransactionFromJson(response.body);
}
