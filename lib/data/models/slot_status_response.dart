import 'dart:convert';

class SlotStatusResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final dynamic message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final SlotStatus? model;
  final dynamic items;
  final dynamic obj;
  final dynamic count;

  SlotStatusResponse({
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

  SlotStatusResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    dynamic message,
    bool? valid,
    int? errorCode,
    dynamic id,
    SlotStatus? model,
    dynamic items,
    dynamic obj,
    dynamic count,
  }) =>
      SlotStatusResponse(
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

  factory SlotStatusResponse.fromJson(String str) =>
      SlotStatusResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SlotStatusResponse.fromMap(Map<String, dynamic> json) =>
      SlotStatusResponse(
        success: json["success"],
        info: json["info"],
        warning: json["warning"],
        message: json["message"],
        valid: json["valid"],
        errorCode: json["errorCode"],
        id: json["id"],
        model: json["model"] == null ? null : SlotStatus.fromMap(json["model"]),
        items: json["items"],
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
        "model": model?.toMap(),
        "items": items,
        "obj": obj,
        "count": count,
      };
}

class SlotStatus {
  final String? actionFlag;
  final String? status;

  SlotStatus({
    this.actionFlag,
    this.status,
  });

  SlotStatus copyWith({
    String? actionFlag,
    String? status,
  }) =>
      SlotStatus(
        actionFlag: actionFlag ?? this.actionFlag,
        status: status ?? this.status,
      );

  factory SlotStatus.fromJson(String str) =>
      SlotStatus.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SlotStatus.fromMap(Map<String, dynamic> json) => SlotStatus(
        actionFlag: json["actionFlag"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "actionFlag": actionFlag,
        "status": status,
      };
}
