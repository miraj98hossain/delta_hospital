import 'dart:convert';

class OnlineSepcializationListResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final List<Specialization>? items;
  final Obj? obj;
  final dynamic count;

  OnlineSepcializationListResponse({
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

  factory OnlineSepcializationListResponse.fromJson(String str) =>
      OnlineSepcializationListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OnlineSepcializationListResponse.fromMap(Map<String, dynamic> json) =>
      OnlineSepcializationListResponse(
        success: json["success"],
        info: json["info"],
        warning: json["warning"],
        message: json["message"],
        valid: json["valid"],
        errorCode: json["errorCode"],
        id: json["id"],
        model: json["model"],
        items: json["items"] == null
            ? []
            : List<Specialization>.from(
                json["items"]!.map((x) => Specialization.fromMap(x))),
        obj: json["obj"] == null ? null : Obj.fromMap(json["obj"]),
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
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
        "obj": obj?.toMap(),
        "count": count,
      };
}

class Specialization {
  final dynamic ssCreator;
  final dynamic ssCreatedOn;
  final dynamic ssCreateSession;
  final dynamic ssModifier;
  final dynamic ssModifiedOn;
  final dynamic ssModifiedSession;
  final int? companyNo;
  final int? id;
  final dynamic specializationId;
  final String? specializationName;
  final dynamic specializationDescription;
  final int? activeStatus;
  final dynamic ssUploadedOn;
  final dynamic idNotEqual;

  Specialization({
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.id,
    this.specializationId,
    this.specializationName,
    this.specializationDescription,
    this.activeStatus,
    this.ssUploadedOn,
    this.idNotEqual,
  });

  factory Specialization.fromJson(String str) =>
      Specialization.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Specialization.fromMap(Map<String, dynamic> json) => Specialization(
        ssCreator: json["ssCreator"],
        ssCreatedOn: json["ssCreatedOn"],
        ssCreateSession: json["ssCreateSession"],
        ssModifier: json["ssModifier"],
        ssModifiedOn: json["ssModifiedOn"],
        ssModifiedSession: json["ssModifiedSession"],
        companyNo: json["companyNo"],
        id: json["id"],
        specializationId: json["specializationId"],
        specializationName: json["specializationName"],
        specializationDescription: json["specializationDescription"],
        activeStatus: json["activeStatus"],
        ssUploadedOn: json["ssUploadedOn"],
        idNotEqual: json["idNotEqual"],
      );

  Map<String, dynamic> toMap() => {
        "ssCreator": ssCreator,
        "ssCreatedOn": ssCreatedOn,
        "ssCreateSession": ssCreateSession,
        "ssModifier": ssModifier,
        "ssModifiedOn": ssModifiedOn,
        "ssModifiedSession": ssModifiedSession,
        "companyNo": companyNo,
        "id": id,
        "specializationId": specializationId,
        "specializationName": specializationName,
        "specializationDescription": specializationDescription,
        "activeStatus": activeStatus,
        "ssUploadedOn": ssUploadedOn,
        "idNotEqual": idNotEqual,
      };
}

class Obj {
  final int? action;
  final String? message;
  final dynamic error;

  Obj({
    this.action,
    this.message,
    this.error,
  });

  factory Obj.fromJson(String str) => Obj.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Obj.fromMap(Map<String, dynamic> json) => Obj(
        action: json["action"],
        message: json["message"],
        error: json["error"],
      );

  Map<String, dynamic> toMap() => {
        "action": action,
        "message": message,
        "error": error,
      };
}
