import 'dart:convert';

class ConsultationTypeResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final List<ConsultationType>? items;
  final dynamic obj;
  final dynamic count;

  ConsultationTypeResponse({
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

  ConsultationTypeResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    String? message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    List<ConsultationType>? items,
    dynamic obj,
    dynamic count,
  }) =>
      ConsultationTypeResponse(
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

  factory ConsultationTypeResponse.fromJson(String str) =>
      ConsultationTypeResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConsultationTypeResponse.fromMap(Map<String, dynamic> json) =>
      ConsultationTypeResponse(
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
            : List<ConsultationType>.from(
                json["items"]!.map((x) => ConsultationType.fromMap(x))),
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

class ConsultationType {
  final String? no;
  final String? name;

  ConsultationType({
    this.no,
    this.name,
  });

  ConsultationType copyWith({
    String? no,
    String? name,
  }) =>
      ConsultationType(
        no: no ?? this.no,
        name: name ?? this.name,
      );

  factory ConsultationType.fromJson(String str) =>
      ConsultationType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConsultationType.fromMap(Map<String, dynamic> json) =>
      ConsultationType(
        no: json["no"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "no": no,
        "name": name,
      };
  @override
  String toString() {
    return name ?? "";
  }
}
