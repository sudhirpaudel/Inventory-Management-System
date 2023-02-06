
import 'dart:convert';


List<ClientModel> clientsFromJson(String str) => List<ClientModel>.from(json.decode(str).map((x) => ClientModel.fromJson(x)));

String clientsToJson(List<ClientModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClientModel {
  ClientModel(
      {required this.clientName,
      required this.clientType,
      this.panNumber,
      this.clientPhone,
      this.province,
      this.district,
      this.address,
      this.municipality,
      this.wardNo,
      this.managerName,
      this.managerPhone,
      this.email});

  String clientName;
  String clientType;
  String? panNumber;
  String? clientPhone;
  String? address;
  String? province;
  String? district;
  String? municipality;
  String? wardNo;
  String? managerName;
  String? managerPhone;
  String? email;

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
      clientName: json["client_name"],
      clientType: json["client_type"],
      panNumber: json["pan_number"],
      clientPhone: json["client_phone"],
      province: json["province"],
      district: json["district"],
      address: json["address"],
      municipality: json["municipality"],
      wardNo: json["ward_no"],
      managerName: json["manager_name"],
      email: json["email"],
      managerPhone: json["manager_phone"]);

  Map<String, dynamic> toJson() => {
        "client_name": clientName,
        "client_type": clientType,
        "pan_number": panNumber,
        "client_phone": clientPhone,
        "province": province,
        "district": district,
        "address": address,
        "municipality": municipality,
        "ward_no": wardNo,
        "manager_name": managerName,
        "manager_phone": managerPhone,
        "email":email
      };
}
