import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventorymanagementsystem/models/customer_model.dart';

class CustomerDatabaseManager {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _res = "Error Occured";
  Future<String> saveCustomer({
    required String name,
    required String panNumber,
    required String district,
    required String location,
    required String managerName,
    required String telephoneNo,
    required String phoneNUmber,
    required String email,
    required String companyType,
  }) async {
    try {
      print('sdsd');
      String customerId = name.substring(0, 3) + district.substring(0, 3);
      CustomerModel customer = CustomerModel(
          name: name,
          panNumber: panNumber,
          district: district,
          location: location,
          managerName: managerName,
          telephoneNo: telephoneNo,
          phoneNUmber: phoneNUmber,
          email: email,
          companyType: companyType);
      _firestore.collection('Customer').doc(customerId).set(customer.toJson());
      _res = "success";
    } catch (err) {
      print(err);
      _res = err.toString();
    }
    return _res;
  }
}
