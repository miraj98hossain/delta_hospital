import 'dart:convert';

class PatientRelationListResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final dynamic message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final List<PatientRelation>? items;
  final dynamic obj;
  final dynamic count;

  PatientRelationListResponse({
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

  PatientRelationListResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    dynamic message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    List<PatientRelation>? items,
    dynamic obj,
    dynamic count,
  }) =>
      PatientRelationListResponse(
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

  factory PatientRelationListResponse.fromJson(String str) =>
      PatientRelationListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PatientRelationListResponse.fromMap(Map<String, dynamic> json) =>
      PatientRelationListResponse(
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
            : List<PatientRelation>.from(
                json["items"]!.map((x) => PatientRelation.fromMap(x))),
        obj: json["obj"],
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
        "obj": obj,
        "count": count,
      };
}

class PatientRelation {
  final String? relationName;
  final String? relationType;
  final String? comments;
  final int? orderNo;
  final int? activeStatus;
  final String? ssCreatedOn;
  final String? ssModifiedOn;
  final String? entityName;
  final int? documentId;

  PatientRelation({
    this.relationName,
    this.relationType,
    this.comments,
    this.orderNo,
    this.activeStatus,
    this.ssCreatedOn,
    this.ssModifiedOn,
    this.entityName,
    this.documentId,
  });

  PatientRelation copyWith({
    String? relationName,
    String? relationType,
    String? comments,
    int? orderNo,
    int? activeStatus,
    String? ssCreatedOn,
    String? ssModifiedOn,
    String? entityName,
    int? documentId,
  }) =>
      PatientRelation(
        relationName: relationName ?? this.relationName,
        relationType: relationType ?? this.relationType,
        comments: comments ?? this.comments,
        orderNo: orderNo ?? this.orderNo,
        activeStatus: activeStatus ?? this.activeStatus,
        ssCreatedOn: ssCreatedOn ?? this.ssCreatedOn,
        ssModifiedOn: ssModifiedOn ?? this.ssModifiedOn,
        entityName: entityName ?? this.entityName,
        documentId: documentId ?? this.documentId,
      );

  factory PatientRelation.fromJson(String str) =>
      PatientRelation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PatientRelation.fromMap(Map<String, dynamic> json) => PatientRelation(
        relationName: json["relationName"],
        relationType: json["relationType"],
        comments: json["comments"],
        orderNo: json["orderNo"],
        activeStatus: json["activeStatus"],
        ssCreatedOn: json["ssCreatedOn"],
        ssModifiedOn: json["ssModifiedOn"],
        entityName: json["entityName"],
        documentId: json["documentId"],
      );

  Map<String, dynamic> toMap() => {
        "relationName": relationName,
        "relationType": relationType,
        "comments": comments,
        "orderNo": orderNo,
        "activeStatus": activeStatus,
        "ssCreatedOn": ssCreatedOn,
        "ssModifiedOn": ssModifiedOn,
        "entityName": entityName,
        "documentId": documentId,
      };
  @override
  String toString() {
    return relationName ?? "";
  }
}
