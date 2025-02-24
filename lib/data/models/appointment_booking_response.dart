import 'dart:convert';

class AppointmentBookingResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final dynamic message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final dynamic items;
  final AppointmentBookingStatus? obj;
  final dynamic count;

  AppointmentBookingResponse({
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

  AppointmentBookingResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    dynamic message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    dynamic items,
    AppointmentBookingStatus? obj,
    dynamic count,
  }) =>
      AppointmentBookingResponse(
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

  factory AppointmentBookingResponse.fromJson(String str) =>
      AppointmentBookingResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppointmentBookingResponse.fromMap(Map<String, dynamic> json) =>
      AppointmentBookingResponse(
        success: json["success"],
        info: json["info"],
        warning: json["warning"],
        message: json["message"],
        valid: json["valid"],
        errorCode: json["errorCode"],
        id: json["id"],
        model: json["model"],
        items: json["items"],
        obj: json["obj"] == null
            ? null
            : AppointmentBookingStatus.fromMap(json["obj"]),
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

class AppointmentBookingStatus {
  final int? slotSl;
  final String? err;
  final String? startTime;
  final String? endTime;
  final int? slotNo;
  final int? appointmentNo;
  final String? appointId;

  AppointmentBookingStatus({
    this.slotSl,
    this.err,
    this.startTime,
    this.endTime,
    this.slotNo,
    this.appointmentNo,
    this.appointId,
  });

  AppointmentBookingStatus copyWith({
    int? slotSl,
    String? err,
    String? startTime,
    String? endTime,
    int? slotNo,
    int? appointmentNo,
    String? appointId,
  }) =>
      AppointmentBookingStatus(
        slotSl: slotSl ?? this.slotSl,
        err: err ?? this.err,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        slotNo: slotNo ?? this.slotNo,
        appointmentNo: appointmentNo ?? this.appointmentNo,
        appointId: appointId ?? this.appointId,
      );

  factory AppointmentBookingStatus.fromJson(String str) =>
      AppointmentBookingStatus.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppointmentBookingStatus.fromMap(Map<String, dynamic> json) =>
      AppointmentBookingStatus(
        slotSl: json["slotSl"],
        err: json["err"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        slotNo: json["slotNo"],
        appointmentNo: json["appointmentNo"],
        appointId: json["appointID"],
      );

  Map<String, dynamic> toMap() => {
        "slotSl": slotSl,
        "err": err,
        "startTime": startTime,
        "endTime": endTime,
        "slotNo": slotNo,
        "appointmentNo": appointmentNo,
        "appointID": appointId,
      };
}
