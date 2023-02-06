import 'dart:convert';

CustomerModel customerModelFromJson(String str) => CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
    CustomerModel({
         required this.name,
        required  this.panNumber,
        required  this.district,
         required this.location,
         required this.managerName,
        required  this.telephoneNo,
        required  this.phoneNUmber,
        required  this.email,
        required  this.companyType,
    });

    String name;
    String panNumber;
    String district;
    String location;
    String managerName;
    String telephoneNo;
    String phoneNUmber;
    String email;
    String companyType;

    factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        name: json["name"],
        panNumber: json["panNumber"],
        district: json["district"],
        location: json["location"],
        managerName: json["managerName"],
        telephoneNo: json["telephoneNo"],
        phoneNUmber: json["phoneNUmber"],
        email: json["email"],
        companyType: json[" companyType"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "panNumber": panNumber,
        "district": district,
        "location": location,
        "managerName": managerName,
        "telephoneNo": telephoneNo,
        "phoneNUmber": phoneNUmber,
        "email": email,
        " companyType": companyType,
    };
}
