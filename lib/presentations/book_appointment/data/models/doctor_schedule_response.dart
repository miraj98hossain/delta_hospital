import 'dart:convert';

class DoctorScheduleResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final dynamic message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final List<DoctorSchedule>? items;
  final dynamic obj;
  final dynamic count;

  DoctorScheduleResponse({
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

  DoctorScheduleResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    dynamic message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    List<DoctorSchedule>? items,
    dynamic obj,
    dynamic count,
  }) =>
      DoctorScheduleResponse(
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

  factory DoctorScheduleResponse.fromJson(String str) =>
      DoctorScheduleResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DoctorScheduleResponse.fromMap(Map<String, dynamic> json) =>
      DoctorScheduleResponse(
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
            : List<DoctorSchedule>.from(
                json["items"]!.map((x) => DoctorSchedule.fromMap(x))),
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

class DoctorSchedule {
  final int? doctorNo;
  final String? doctorName;
  final String? scheduleDay;
  final String? scheduleTime;

  DoctorSchedule({
    this.doctorNo,
    this.doctorName,
    this.scheduleDay,
    this.scheduleTime,
  });

  DoctorSchedule copyWith({
    int? doctorNo,
    String? doctorName,
    String? scheduleDay,
    String? scheduleTime,
  }) =>
      DoctorSchedule(
        doctorNo: doctorNo ?? this.doctorNo,
        doctorName: doctorName ?? this.doctorName,
        scheduleDay: scheduleDay ?? this.scheduleDay,
        scheduleTime: scheduleTime ?? this.scheduleTime,
      );

  factory DoctorSchedule.fromJson(String str) =>
      DoctorSchedule.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DoctorSchedule.fromMap(Map<String, dynamic> json) => DoctorSchedule(
        doctorNo: json["doctorNo"],
        doctorName: json["doctorName"],
        scheduleDay: json["scheduleDay"],
        scheduleTime: json["scheduleTime"],
      );

  Map<String, dynamic> toMap() => {
        "doctorNo": doctorNo,
        "doctorName": doctorName,
        "scheduleDay": scheduleDay,
        "scheduleTime": scheduleTime,
      };
}
