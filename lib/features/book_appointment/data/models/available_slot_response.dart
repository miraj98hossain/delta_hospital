import 'dart:convert';

class AvailableSlotResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final dynamic message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final List<Slot>? items;
  final dynamic obj;
  final dynamic count;

  AvailableSlotResponse({
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

  AvailableSlotResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    dynamic message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    List<Slot>? items,
    dynamic obj,
    dynamic count,
  }) =>
      AvailableSlotResponse(
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

  factory AvailableSlotResponse.fromJson(String str) =>
      AvailableSlotResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AvailableSlotResponse.fromMap(Map<String, dynamic> json) =>
      AvailableSlotResponse(
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
            : List<Slot>.from(json["items"]!.map((x) => Slot.fromMap(x))),
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

class Slot {
  final int? slotNo;
  final int? doctorNo;
  final String? doctorName;
  final String? appointDate;
  final int? shiftdtlNo;
  final String? shift;
  final int? slotSl;
  final String? startTime;
  final String? endTime;
  final int? durationMin;
  final int? extraSlot;
  final int? slotSplited;
  final int? ssCreator;
  final String? ssCreatedOn;
  final dynamic remarks;
  final int? appointStatus;
  final int? slotAppointStatus;
  final dynamic scheduleDate;

  Slot({
    this.slotNo,
    this.doctorNo,
    this.doctorName,
    this.appointDate,
    this.shiftdtlNo,
    this.shift,
    this.slotSl,
    this.startTime,
    this.endTime,
    this.durationMin,
    this.extraSlot,
    this.slotSplited,
    this.ssCreator,
    this.ssCreatedOn,
    this.remarks,
    this.appointStatus,
    this.slotAppointStatus,
    this.scheduleDate,
  });

  Slot copyWith({
    int? slotNo,
    int? doctorNo,
    String? doctorName,
    String? appointDate,
    int? shiftdtlNo,
    String? shift,
    int? slotSl,
    String? startTime,
    String? endTime,
    int? durationMin,
    int? extraSlot,
    int? slotSplited,
    int? ssCreator,
    String? ssCreatedOn,
    dynamic remarks,
    int? appointStatus,
    int? slotAppointStatus,
    dynamic scheduleDate,
  }) =>
      Slot(
        slotNo: slotNo ?? this.slotNo,
        doctorNo: doctorNo ?? this.doctorNo,
        doctorName: doctorName ?? this.doctorName,
        appointDate: appointDate ?? this.appointDate,
        shiftdtlNo: shiftdtlNo ?? this.shiftdtlNo,
        shift: shift ?? this.shift,
        slotSl: slotSl ?? this.slotSl,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        durationMin: durationMin ?? this.durationMin,
        extraSlot: extraSlot ?? this.extraSlot,
        slotSplited: slotSplited ?? this.slotSplited,
        ssCreator: ssCreator ?? this.ssCreator,
        ssCreatedOn: ssCreatedOn ?? this.ssCreatedOn,
        remarks: remarks ?? this.remarks,
        appointStatus: appointStatus ?? this.appointStatus,
        slotAppointStatus: slotAppointStatus ?? this.slotAppointStatus,
        scheduleDate: scheduleDate ?? this.scheduleDate,
      );

  factory Slot.fromJson(String str) => Slot.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Slot.fromMap(Map<String, dynamic> json) => Slot(
        slotNo: json["slotNo"],
        doctorNo: json["doctorNo"],
        doctorName: json["doctorName"],
        appointDate: json["appointDate"],
        shiftdtlNo: json["shiftdtlNo"],
        shift: json["shift"],
        slotSl: json["slotSl"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        durationMin: json["durationMin"],
        extraSlot: json["extraSlot"],
        slotSplited: json["slotSplited"],
        ssCreator: json["ssCreator"],
        ssCreatedOn: json["ssCreatedOn"],
        remarks: json["remarks"],
        appointStatus: json["appointStatus"],
        slotAppointStatus: json["slotAppointStatus"],
        scheduleDate: json["scheduleDate"],
      );

  Map<String, dynamic> toMap() => {
        "slotNo": slotNo,
        "doctorNo": doctorNo,
        "doctorName": doctorName,
        "appointDate": appointDate,
        "shiftdtlNo": shiftdtlNo,
        "shift": shift,
        "slotSl": slotSl,
        "startTime": startTime,
        "endTime": endTime,
        "durationMin": durationMin,
        "extraSlot": extraSlot,
        "slotSplited": slotSplited,
        "ssCreator": ssCreator,
        "ssCreatedOn": ssCreatedOn,
        "remarks": remarks,
        "appointStatus": appointStatus,
        "slotAppointStatus": slotAppointStatus,
        "scheduleDate": scheduleDate,
      };
}
