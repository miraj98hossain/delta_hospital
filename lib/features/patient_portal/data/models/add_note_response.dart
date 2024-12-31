import 'dart:convert';

class AddNoteResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final dynamic items;
  final Obj? obj;
  final dynamic count;

  AddNoteResponse({
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

  AddNoteResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    String? message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    dynamic items,
    Obj? obj,
    dynamic count,
  }) =>
      AddNoteResponse(
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

  factory AddNoteResponse.fromJson(String str) =>
      AddNoteResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddNoteResponse.fromMap(Map<String, dynamic> json) => AddNoteResponse(
        success: json["success"],
        info: json["info"],
        warning: json["warning"],
        message: json["message"],
        valid: json["valid"],
        errorCode: json["errorCode"],
        id: json["id"],
        model: json["model"],
        items: json["items"],
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
        "items": items,
        "obj": obj?.toMap(),
        "count": count,
      };
}

class Obj {
  final int? ssCreator;
  final String? ssCreatedOn;
  final int? ssCreateSession;
  final int? ssModifier;
  final String? ssModifiedOn;
  final int? ssModifiedSession;
  final int? companyNo;
  final int? id;
  final String? patNoteId;
  final String? patNoteTitle;
  final String? patNoteDetail;
  final String? patNoteHospitalNumber;
  final int? activeStatus;

  Obj({
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.id,
    this.patNoteId,
    this.patNoteTitle,
    this.patNoteDetail,
    this.patNoteHospitalNumber,
    this.activeStatus,
  });

  Obj copyWith({
    int? ssCreator,
    String? ssCreatedOn,
    int? ssCreateSession,
    int? ssModifier,
    String? ssModifiedOn,
    int? ssModifiedSession,
    int? companyNo,
    int? id,
    String? patNoteId,
    String? patNoteTitle,
    String? patNoteDetail,
    String? patNoteHospitalNumber,
    int? activeStatus,
  }) =>
      Obj(
        ssCreator: ssCreator ?? this.ssCreator,
        ssCreatedOn: ssCreatedOn ?? this.ssCreatedOn,
        ssCreateSession: ssCreateSession ?? this.ssCreateSession,
        ssModifier: ssModifier ?? this.ssModifier,
        ssModifiedOn: ssModifiedOn ?? this.ssModifiedOn,
        ssModifiedSession: ssModifiedSession ?? this.ssModifiedSession,
        companyNo: companyNo ?? this.companyNo,
        id: id ?? this.id,
        patNoteId: patNoteId ?? this.patNoteId,
        patNoteTitle: patNoteTitle ?? this.patNoteTitle,
        patNoteDetail: patNoteDetail ?? this.patNoteDetail,
        patNoteHospitalNumber:
            patNoteHospitalNumber ?? this.patNoteHospitalNumber,
        activeStatus: activeStatus ?? this.activeStatus,
      );

  factory Obj.fromJson(String str) => Obj.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Obj.fromMap(Map<String, dynamic> json) => Obj(
        ssCreator: json["ssCreator"],
        ssCreatedOn: json["ssCreatedOn"],
        ssCreateSession: json["ssCreateSession"],
        ssModifier: json["ssModifier"],
        ssModifiedOn: json["ssModifiedOn"],
        ssModifiedSession: json["ssModifiedSession"],
        companyNo: json["companyNo"],
        id: json["id"],
        patNoteId: json["patNoteId"],
        patNoteTitle: json["patNoteTitle"],
        patNoteDetail: json["patNoteDetail"],
        patNoteHospitalNumber: json["patNoteHospitalNumber"],
        activeStatus: json["activeStatus"],
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
        "patNoteId": patNoteId,
        "patNoteTitle": patNoteTitle,
        "patNoteDetail": patNoteDetail,
        "patNoteHospitalNumber": patNoteHospitalNumber,
        "activeStatus": activeStatus,
      };
}
