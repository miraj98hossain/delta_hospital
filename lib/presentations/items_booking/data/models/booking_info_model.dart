import 'dart:convert';

import 'package:delta_hospital/app/data/models/his_patient_info_response.dart';
import 'package:delta_hospital/presentations/items_booking/data/models/item_grid_list_response.dart';

class BookingInfoModel extends HisPatientInfo {
  final int? foreignTraveler;
  final String? preferredSamCollDate;
  final String? expectedRepDeliDate;
  final List<ItemInfo>? diagItemBookingDtlList;
  final num? totalAmt;
  final num? discountAmt;
  final num? netTotalAmt;
  final int? sampleCallFlag;
  BookingInfoModel({
    required super.activeStatus,
    required super.patientName,
    required super.fname,
    required super.lname,
    required super.salutation,
    required super.gender,
    required super.dob,
    required super.ageYy,
    required super.ageMm,
    required super.ageDd,
    required super.phoneMobile,
    required super.email,
    required super.bloodGroup,
    required super.fatherName,
    required super.spouseName,
    required super.motherName,
    required super.maritalStatus,
    required super.religion,
    required super.nationalId,
    required super.passportNo,
    required super.address,
    required this.preferredSamCollDate,
    required this.expectedRepDeliDate,
    required this.diagItemBookingDtlList,
    required this.foreignTraveler,
    required this.sampleCallFlag,
    required this.totalAmt,
    required this.discountAmt,
    required this.netTotalAmt,
  });
  factory BookingInfoModel.fromJson(String str) =>
      BookingInfoModel.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory BookingInfoModel.fromMap(Map<String, dynamic> json) =>
      BookingInfoModel(
        activeStatus: json["activeStatus"],
        foreignTraveler: json["foreignTraveler"],
        salutation: json["salutation"],
        gender: json["gender"],
        fname: json["fname"],
        dob: json["dob"],
        ageYy: json["ageYy"],
        ageMm: json["ageMm"],
        ageDd: json["ageDd"],
        phoneMobile: json["mobileNo"],
        email: json["email"],
        bloodGroup: json["bloodGroup"],
        sampleCallFlag: json["sampleCallFlag"],
        fatherName: json["fatherName"],
        spouseName: json["spouseName"],
        motherName: json["motherName"],
        maritalStatus: json["maritalStatus"],
        religion: json["religion"],
        nationalId: json["nationalId"],
        passportNo: json["passportNo"],
        address: json["address"],
        preferredSamCollDate: json["preferredSamCollDate"],
        expectedRepDeliDate: json["expectedRepDeliDate"],
        diagItemBookingDtlList: json["diagItemBookingDtlList"] == null
            ? []
            : List<ItemInfo>.from(json["diagItemBookingDtlList"]!
                .map((x) => ItemInfo.fromMap(x))),
        patientName: json["patientName"],
        totalAmt: json["totalAmt"],
        discountAmt: json["discountAmt"],
        netTotalAmt: json["netTotalAmt"],
        lname: json["lastName"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "activeStatus": activeStatus,
        "foreignTraveler": foreignTraveler,
        "salutation": salutation,
        "gender": gender,
        "firstName": fname,
        "fname": fname,
        "lastName": lname,
        "dob": dob,
        "ageYy": ageYy,
        "ageMm": ageMm,
        "ageDd": ageDd,
        "mobileNo": phoneMobile,
        "email": email,
        "bloodGroup": bloodGroup,
        "sampleCallFlag": sampleCallFlag,
        "fatherName": fatherName,
        "spouseName": spouseName,
        "motherName": motherName,
        "maritalStatus": maritalStatus,
        "religion": religion,
        "nationalId": nationalId,
        "passportNo": passportNo,
        "address": "Banasree",
        "preferredSamCollDate": preferredSamCollDate,
        "expectedRepDeliDate": expectedRepDeliDate,
        "diagItemBookingDtlList": diagItemBookingDtlList == null
            ? []
            : List<dynamic>.from(diagItemBookingDtlList!.map((x) => x.toMap())),
        "patientName": patientName,
        "totalAmt": totalAmt,
        "discountAmt": discountAmt,
        "netTotalAmt": netTotalAmt
      };
}
