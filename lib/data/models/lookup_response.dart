import 'dart:convert';

class LookUpResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final List<LookUpDetails>? items;
  final dynamic obj;
  final dynamic count;

  LookUpResponse({
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

  LookUpResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    String? message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    List<LookUpDetails>? items,
    dynamic obj,
    dynamic count,
  }) =>
      LookUpResponse(
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

  factory LookUpResponse.fromJson(String str) =>
      LookUpResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LookUpResponse.fromMap(Map<String, dynamic> json) => LookUpResponse(
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
            : List<LookUpDetails>.from(
                json["items"]!.map((x) => LookUpDetails.fromMap(x))),
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

class LookUpDetails {
  final String? lookupTitle;
  final String? shortDescription;
  final String? lookupDescription;
  final String? image;
  final String? link;
  final int? lookupTypeNo;
  final int? orderNo;
  final int? activeStatus;
  final String? ssCreatedOn;
  final String? ssModifiedOn;
  final String? publishedDate;
  final String? circulationEndDate;
  final String? entityName;
  final int? documentId;
  final String? lookupTypeName;

  LookUpDetails({
    this.lookupTitle,
    this.shortDescription,
    this.lookupDescription,
    this.image,
    this.link,
    this.lookupTypeNo,
    this.orderNo,
    this.activeStatus,
    this.ssCreatedOn,
    this.ssModifiedOn,
    this.publishedDate,
    this.circulationEndDate,
    this.entityName,
    this.documentId,
    this.lookupTypeName,
  });

  LookUpDetails copyWith({
    String? lookupTitle,
    String? shortDescription,
    String? lookupDescription,
    String? image,
    String? link,
    int? lookupTypeNo,
    int? orderNo,
    int? activeStatus,
    String? ssCreatedOn,
    String? ssModifiedOn,
    String? publishedDate,
    String? circulationEndDate,
    String? entityName,
    int? documentId,
    String? lookupTypeName,
  }) =>
      LookUpDetails(
        lookupTitle: lookupTitle ?? this.lookupTitle,
        shortDescription: shortDescription ?? this.shortDescription,
        lookupDescription: lookupDescription ?? this.lookupDescription,
        image: image ?? this.image,
        link: link ?? this.link,
        lookupTypeNo: lookupTypeNo ?? this.lookupTypeNo,
        orderNo: orderNo ?? this.orderNo,
        activeStatus: activeStatus ?? this.activeStatus,
        ssCreatedOn: ssCreatedOn ?? this.ssCreatedOn,
        ssModifiedOn: ssModifiedOn ?? this.ssModifiedOn,
        publishedDate: publishedDate ?? this.publishedDate,
        circulationEndDate: circulationEndDate ?? this.circulationEndDate,
        entityName: entityName ?? this.entityName,
        documentId: documentId ?? this.documentId,
        lookupTypeName: lookupTypeName ?? this.lookupTypeName,
      );

  factory LookUpDetails.fromJson(String str) =>
      LookUpDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LookUpDetails.fromMap(Map<String, dynamic> json) => LookUpDetails(
        lookupTitle: json["lookupTitle"],
        shortDescription: json["shortDescription"],
        lookupDescription: json["lookupDescription"],
        image: json["image"],
        link: json["link"],
        lookupTypeNo: json["lookupTypeNo"],
        orderNo: json["orderNo"],
        activeStatus: json["activeStatus"],
        ssCreatedOn: json["ssCreatedOn"],
        ssModifiedOn: json["ssModifiedOn"],
        publishedDate: json["publishedDate"],
        circulationEndDate: json["circulationEndDate"],
        entityName: json["entityName"],
        documentId: json["documentId"],
        lookupTypeName: json["lookupTypeName"],
      );

  Map<String, dynamic> toMap() => {
        "lookupTitle": lookupTitle,
        "shortDescription": shortDescription,
        "lookupDescription": lookupDescription,
        "image": image,
        "link": link,
        "lookupTypeNo": lookupTypeNo,
        "orderNo": orderNo,
        "activeStatus": activeStatus,
        "ssCreatedOn": ssCreatedOn,
        "ssModifiedOn": ssModifiedOn,
        "publishedDate": publishedDate,
        "circulationEndDate": circulationEndDate,
        "entityName": entityName,
        "documentId": documentId,
        "lookupTypeName": lookupTypeName,
      };
}
