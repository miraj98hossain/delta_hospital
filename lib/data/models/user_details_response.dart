import 'dart:convert';

class UserDetailsResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final dynamic message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final dynamic items;
  final UserDetails? obj;
  final dynamic count;

  UserDetailsResponse({
    this.success,
    this.info,
    this.warning,
    this.message,
    this.valid,
    this.errorCode,
    this.id,
    this.model,
    this.items,
    this.obj,
    this.count,
  });

  UserDetailsResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    dynamic message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    dynamic items,
    UserDetails? obj,
    dynamic count,
  }) =>
      UserDetailsResponse(
        success: success ?? this.success,
        info: info ?? this.info,
        warning: warning ?? this.warning,
        message: message ?? this.message,
        valid: valid ?? this.valid,
        errorCode: errorCode ?? this.errorCode,
        id: id ?? this.id,
        model: model ?? this.model,
        items: items ?? this.items,
        obj: obj ?? this.obj,
        count: count ?? this.count,
      );

  factory UserDetailsResponse.fromJson(String str) =>
      UserDetailsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDetailsResponse.fromMap(Map<String, dynamic> json) =>
      UserDetailsResponse(
        success: json["success"],
        info: json["info"],
        warning: json["warning"],
        message: json["message"],
        valid: json["valid"],
        errorCode: json["errorCode"],
        id: json["id"],
        model: json["model"],
        items: json["items"],
        obj: json["obj"] == null ? null : UserDetails.fromMap(json["obj"]),
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "info": info,
        "warning": warning,
        "message": message,
        "valid": valid,
        "errorCode": errorCode,
        "id": id,
        "model": model,
        "items": items,
        "obj": obj?.toMap(),
        "count": count,
      };
}

class UserDetails {
  final String? jobTile;
  final dynamic lastName;
  final String? businessUnitName;
  final dynamic btbLabNo;
  final dynamic address1;
  final dynamic photo;
  final int? defaultCompanyId;
  final dynamic phoneOffice;
  final String? userName;
  final int? doctorNo;
  final dynamic emailOfficial;
  final String? firstName;
  final dynamic bloodGroup;
  final String? defaultCompanyAlias;
  final int? businessUnitNo;
  final List<CompanyList>? companyList;
  final String? dob;
  final dynamic billUnitNo;
  final String? name;
  final String? defaultCompanyName;
  final String? userDefaultPageLink;

  UserDetails({
    this.jobTile,
    this.lastName,
    this.businessUnitName,
    this.btbLabNo,
    this.address1,
    this.photo,
    this.defaultCompanyId,
    this.phoneOffice,
    this.userName,
    this.doctorNo,
    this.emailOfficial,
    this.firstName,
    this.bloodGroup,
    this.defaultCompanyAlias,
    this.businessUnitNo,
    this.companyList,
    this.dob,
    this.billUnitNo,
    this.name,
    this.defaultCompanyName,
    this.userDefaultPageLink,
  });

  UserDetails copyWith({
    String? jobTile,
    dynamic lastName,
    String? businessUnitName,
    dynamic btbLabNo,
    dynamic address1,
    dynamic photo,
    int? defaultCompanyId,
    dynamic phoneOffice,
    String? userName,
    int? doctorNo,
    dynamic emailOfficial,
    String? firstName,
    dynamic bloodGroup,
    String? defaultCompanyAlias,
    int? businessUnitNo,
    List<CompanyList>? companyList,
    String? dob,
    dynamic billUnitNo,
    String? name,
    String? defaultCompanyName,
    String? userDefaultPageLink,
  }) =>
      UserDetails(
        jobTile: jobTile ?? this.jobTile,
        lastName: lastName ?? this.lastName,
        businessUnitName: businessUnitName ?? this.businessUnitName,
        btbLabNo: btbLabNo ?? this.btbLabNo,
        address1: address1 ?? this.address1,
        photo: photo ?? this.photo,
        defaultCompanyId: defaultCompanyId ?? this.defaultCompanyId,
        phoneOffice: phoneOffice ?? this.phoneOffice,
        userName: userName ?? this.userName,
        doctorNo: doctorNo ?? this.doctorNo,
        emailOfficial: emailOfficial ?? this.emailOfficial,
        firstName: firstName ?? this.firstName,
        bloodGroup: bloodGroup ?? this.bloodGroup,
        defaultCompanyAlias: defaultCompanyAlias ?? this.defaultCompanyAlias,
        businessUnitNo: businessUnitNo ?? this.businessUnitNo,
        companyList: companyList ?? this.companyList,
        dob: dob ?? this.dob,
        billUnitNo: billUnitNo ?? this.billUnitNo,
        name: name ?? this.name,
        defaultCompanyName: defaultCompanyName ?? this.defaultCompanyName,
        userDefaultPageLink: userDefaultPageLink ?? this.userDefaultPageLink,
      );

  factory UserDetails.fromJson(String str) =>
      UserDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDetails.fromMap(Map<String, dynamic> json) => UserDetails(
        jobTile: json["jobTile"],
        lastName: json["lastName"],
        businessUnitName: json["businessUnitName"],
        btbLabNo: json["btbLabNo"],
        address1: json["address1"],
        photo: json["photo"],
        defaultCompanyId: json["defaultCompanyId"],
        phoneOffice: json["phoneOffice"],
        userName: json["userName"],
        doctorNo: json["doctorNo"],
        emailOfficial: json["emailOfficial"],
        firstName: json["firstName"],
        bloodGroup: json["bloodGroup"],
        defaultCompanyAlias: json["defaultCompanyAlias"],
        businessUnitNo: json["businessUnitNo"],
        companyList: json["companyList"] == null
            ? []
            : List<CompanyList>.from(
                json["companyList"]!.map((x) => CompanyList.fromMap(x))),
        dob: json["dob"],
        billUnitNo: json["billUnitNo"],
        name: json["name"],
        defaultCompanyName: json["defaultCompanyName"],
        userDefaultPageLink: json["userDefaultPageLink"],
      );

  Map<String, dynamic> toMap() => {
        "jobTile": jobTile,
        "lastName": lastName,
        "businessUnitName": businessUnitName,
        "btbLabNo": btbLabNo,
        "address1": address1,
        "photo": photo,
        "defaultCompanyId": defaultCompanyId,
        "phoneOffice": phoneOffice,
        "userName": userName,
        "doctorNo": doctorNo,
        "emailOfficial": emailOfficial,
        "firstName": firstName,
        "bloodGroup": bloodGroup,
        "defaultCompanyAlias": defaultCompanyAlias,
        "businessUnitNo": businessUnitNo,
        "companyList": companyList == null
            ? []
            : List<dynamic>.from(companyList!.map((x) => x.toMap())),
        "dob": dob,
        "billUnitNo": billUnitNo,
        "name": name,
        "defaultCompanyName": defaultCompanyName,
        "userDefaultPageLink": userDefaultPageLink,
      };
}

class CompanyList {
  final int? companyId;
  final String? compnayName;
  final String? compnayAddress1;
  final String? compnayAddress2;
  final String? compnayEmail;
  final int? orgId;

  CompanyList({
    this.companyId,
    this.compnayName,
    this.compnayAddress1,
    this.compnayAddress2,
    this.compnayEmail,
    this.orgId,
  });

  CompanyList copyWith({
    int? companyId,
    String? compnayName,
    String? compnayAddress1,
    String? compnayAddress2,
    String? compnayEmail,
    int? orgId,
  }) =>
      CompanyList(
        companyId: companyId ?? this.companyId,
        compnayName: compnayName ?? this.compnayName,
        compnayAddress1: compnayAddress1 ?? this.compnayAddress1,
        compnayAddress2: compnayAddress2 ?? this.compnayAddress2,
        compnayEmail: compnayEmail ?? this.compnayEmail,
        orgId: orgId ?? this.orgId,
      );

  factory CompanyList.fromJson(String str) =>
      CompanyList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompanyList.fromMap(Map<String, dynamic> json) => CompanyList(
        companyId: json["companyId"],
        compnayName: json["compnayName"],
        compnayAddress1: json["compnayAddress1"],
        compnayAddress2: json["compnayAddress2"],
        compnayEmail: json["compnayEmail"],
        orgId: json["orgId"],
      );

  Map<String, dynamic> toMap() => {
        "companyId": companyId,
        "compnayName": compnayName,
        "compnayAddress1": compnayAddress1,
        "compnayAddress2": compnayAddress2,
        "compnayEmail": compnayEmail,
        "orgId": orgId,
      };
}
