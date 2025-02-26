import 'dart:convert';

class HnRegistration {
  final String? salutation;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? phone;
  final String? dob;
  final int? ageDd;
  final int? ageMm;
  final int? ageYy;
  final String? address;
  final String? email;
  final int? payFlag;
  final num? payAmount;
  final int? regNo;
  final int? companyNo;
  final String? pgVendorName;
  final String? pgORderId;

  HnRegistration({
    this.salutation,
    this.firstName,
    this.lastName,
    this.gender,
    this.phone,
    this.dob,
    this.ageDd,
    this.ageMm,
    this.ageYy,
    this.address,
    this.email,
    this.payFlag,
    this.payAmount,
    this.regNo,
    this.companyNo,
    this.pgVendorName,
    this.pgORderId,
  });

  HnRegistration copyWith({
    String? salutation,
    String? firstName,
    String? lastname,
    String? gender,
    String? phone,
    String? dob,
    int? ageDd,
    int? ageMm,
    int? ageYy,
    String? address,
    String? email,
    int? payFlag,
    num? payAmount,
    int? regNo,
    int? companyNo,
    String? pgVendorName,
    String? pgORderId,
  }) =>
      HnRegistration(
        salutation: salutation ?? this.salutation,
        firstName: firstName ?? this.firstName,
        lastName: lastname ?? this.lastName,
        gender: gender ?? this.gender,
        phone: phone ?? this.phone,
        dob: dob ?? this.dob,
        ageDd: ageDd ?? this.ageDd,
        ageMm: ageMm ?? this.ageMm,
        ageYy: ageYy ?? this.ageYy,
        address: address ?? this.address,
        email: email ?? this.email,
        payFlag: payFlag ?? this.payFlag,
        payAmount: payAmount ?? this.payAmount,
        regNo: regNo ?? this.regNo,
        companyNo: companyNo ?? this.companyNo,
        pgVendorName: pgVendorName ?? this.pgVendorName,
        pgORderId: pgORderId ?? this.pgORderId,
      );

  factory HnRegistration.fromJson(String str) =>
      HnRegistration.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HnRegistration.fromMap(Map<String, dynamic> json) => HnRegistration(
        salutation: json["salutation"],
        firstName: json["firstName"],
        lastName: json["lastname"],
        gender: json["gender"],
        phone: json["phone"],
        dob: json["dob"],
        ageDd: json["ageDD"],
        ageMm: json["ageMM"],
        ageYy: json["ageYY"],
        address: json["address"],
        email: json["email"],
        payFlag: json["payFlag"],
        payAmount: json["payAmount"],
        regNo: json["regNo"],
        companyNo: json["companyNo"],
        pgVendorName: json["pgVendorName"],
        pgORderId: json["pgORderId"],
      );

  Map<String, dynamic> toMap() => {
        "salutation": salutation,
        "firstName": firstName,
        "lastname": lastName,
        "gender": gender,
        "phone": phone,
        "dob": dob,
        "ageDD": ageDd,
        "ageMM": ageMm,
        "ageYY": ageYy,
        "address": address,
        "email": email,
        "payFlag": payFlag,
        "payAmount": payAmount,
        "regNo": regNo,
        "companyNo": companyNo,
        "pgVendorName": pgVendorName,
        "pgORderId": pgORderId,
      };
}
