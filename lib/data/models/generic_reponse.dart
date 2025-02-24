import 'dart:convert';

class GenericResponse {
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

  GenericResponse({
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

  GenericResponse copyWith({
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
      GenericResponse(
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

  factory GenericResponse.fromJson(String str) =>
      GenericResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GenericResponse.fromMap(Map<String, dynamic> json) => GenericResponse(
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
  final UpdateTime? updateTime;

  Obj({
    this.updateTime,
  });

  Obj copyWith({
    UpdateTime? updateTime,
  }) =>
      Obj(
        updateTime: updateTime ?? this.updateTime,
      );

  factory Obj.fromJson(String str) => Obj.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Obj.fromMap(Map<String, dynamic> json) => Obj(
        updateTime: json["updateTime"] == null
            ? null
            : UpdateTime.fromMap(json["updateTime"]),
      );

  Map<String, dynamic> toMap() => {
        "updateTime": updateTime?.toMap(),
      };
}

class UpdateTime {
  final int? seconds;
  final int? nanos;

  UpdateTime({
    this.seconds,
    this.nanos,
  });

  UpdateTime copyWith({
    int? seconds,
    int? nanos,
  }) =>
      UpdateTime(
        seconds: seconds ?? this.seconds,
        nanos: nanos ?? this.nanos,
      );

  factory UpdateTime.fromJson(String str) =>
      UpdateTime.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateTime.fromMap(Map<String, dynamic> json) => UpdateTime(
        seconds: json["seconds"],
        nanos: json["nanos"],
      );

  Map<String, dynamic> toMap() => {
        "seconds": seconds,
        "nanos": nanos,
      };
}
