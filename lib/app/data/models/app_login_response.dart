import 'dart:convert';

class AppLoginResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final dynamic items;
  final AppUserDetails? obj;
  final dynamic count;

  AppLoginResponse({
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

  AppLoginResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    String? message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    dynamic items,
    AppUserDetails? obj,
    dynamic count,
  }) =>
      AppLoginResponse(
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

  factory AppLoginResponse.fromJson(String str) =>
      AppLoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppLoginResponse.fromMap(Map<String, dynamic> json) =>
      AppLoginResponse(
        success: json["success"],
        info: json["info"],
        warning: json["warning"],
        message: json["message"],
        valid: json["valid"],
        errorCode: json["errorCode"],
        id: json["id"],
        model: json["model"],
        items: json["items"],
        obj: json["obj"] == null ? null : AppUserDetails.fromMap(json["obj"]),
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

class AppUserDetails {
  final String? deviceId;
  final String? userId;
  final String? phone;
  final String? mrn;
  final String? firstName;
  final String? lastName;
  final dynamic userImage;
  final String? dateOfBirth;
  final int? ageYear;
  final int? ageMonth;
  final int? ageDay;
  final String? gender;
  final String? email;
  final String? division;
  final String? fullAddress;
  final String? nationalId;
  final String? birthCertificate;
  final String? passportNumber;
  final String? password;
  final int? activeStatus;
  final String? ssCreatedOn;
  final String? ssModifiedOn;
  final String? entityName;
  final int? documentId;

  AppUserDetails({
    this.deviceId,
    this.userId,
    this.phone,
    this.mrn,
    this.firstName,
    this.lastName,
    this.userImage,
    this.dateOfBirth,
    this.ageYear,
    this.ageMonth,
    this.ageDay,
    this.gender,
    this.email,
    this.division,
    this.fullAddress,
    this.nationalId,
    this.birthCertificate,
    this.passportNumber,
    this.password,
    this.activeStatus,
    this.ssCreatedOn,
    this.ssModifiedOn,
    this.entityName,
    this.documentId,
  });

  AppUserDetails copyWith({
    String? deviceId,
    String? userId,
    String? phone,
    String? mrn,
    String? firstName,
    String? lastName,
    dynamic userImage,
    String? dateOfBirth,
    int? ageYear,
    int? ageMonth,
    int? ageDay,
    String? gender,
    String? email,
    String? division,
    String? fullAddress,
    String? nationalId,
    String? birthCertificate,
    String? passportNumber,
    String? password,
    int? activeStatus,
    String? ssCreatedOn,
    String? ssModifiedOn,
    String? entityName,
    int? documentId,
  }) =>
      AppUserDetails(
        deviceId: deviceId ?? this.deviceId,
        userId: userId ?? this.userId,
        phone: phone ?? this.phone,
        mrn: mrn ?? this.mrn,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        userImage: userImage ?? this.userImage,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        ageYear: ageYear ?? this.ageYear,
        ageMonth: ageMonth ?? this.ageMonth,
        ageDay: ageDay ?? this.ageDay,
        gender: gender ?? this.gender,
        email: email ?? this.email,
        division: division ?? this.division,
        fullAddress: fullAddress ?? this.fullAddress,
        nationalId: nationalId ?? this.nationalId,
        birthCertificate: birthCertificate ?? this.birthCertificate,
        passportNumber: passportNumber ?? this.passportNumber,
        password: password ?? this.password,
        activeStatus: activeStatus ?? this.activeStatus,
        ssCreatedOn: ssCreatedOn ?? this.ssCreatedOn,
        ssModifiedOn: ssModifiedOn ?? this.ssModifiedOn,
        entityName: entityName ?? this.entityName,
        documentId: documentId ?? this.documentId,
      );

  factory AppUserDetails.fromJson(String str) =>
      AppUserDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppUserDetails.fromMap(Map<String, dynamic> json) => AppUserDetails(
        deviceId: json["deviceId"],
        userId: json["userId"],
        phone: json["phone"],
        mrn: json["mrn"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        userImage: json["userImage"],
        dateOfBirth: json["dateOfBirth"],
        ageYear: json["ageYear"],
        ageMonth: json["ageMonth"],
        ageDay: json["ageDay"],
        gender: json["gender"],
        email: json["email"],
        division: json["division"],
        fullAddress: json["fullAddress"],
        nationalId: json["nationalId"],
        birthCertificate: json["birthCertificate"],
        passportNumber: json["passportNumber"],
        password: json["password"],
        activeStatus: json["activeStatus"],
        ssCreatedOn: json["ssCreatedOn"],
        ssModifiedOn: json["ssModifiedOn"],
        entityName: json["entityName"],
        documentId: json["documentId"],
      );

  Map<String, dynamic> toMap() => {
        "deviceId": deviceId,
        "userId": userId,
        "phone": phone,
        "mrn": mrn,
        "firstName": firstName,
        "lastName": lastName,
        "userImage": userImage,
        "dateOfBirth": dateOfBirth,
        "ageYear": ageYear,
        "ageMonth": ageMonth,
        "ageDay": ageDay,
        "gender": gender,
        "email": email,
        "division": division,
        "fullAddress": fullAddress,
        "nationalId": nationalId,
        "birthCertificate": birthCertificate,
        "passportNumber": passportNumber,
        "password": password,
        "activeStatus": activeStatus,
        "ssCreatedOn": ssCreatedOn,
        "ssModifiedOn": ssModifiedOn,
        "entityName": entityName,
        "documentId": documentId,
      };
}
