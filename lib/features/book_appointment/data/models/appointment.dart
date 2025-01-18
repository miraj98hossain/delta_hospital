import 'dart:convert';

class Appointment {
  final String slotNo;
  final String doctorNo;
  final String doctorName;
  final String appointDate;
  final String shiftdtlNo;
  final String shift;
  final String slotSl;
  final String startTime;
  final String endTime;
  final String durationMin;
  final String extraSlot;
  final String slotSplited;
  final String ssCreator;
  final String ssCreatedOn;
  final String remarks;
  final int appointStatus;
  final String slotAppointStatus;
  final String patientType;
  final String consultationType;
  final String opdConsultationFee;
  final String companyNo;
  final String hospitalNumber;
  final String companyNameClass;
  final int regNo;
  final String patientName;
  final String phoneMobile;
  final dynamic email;
  final String dob;
  final String gender;
  final String address;
  final int ageYy;
  final int ageMm;
  final dynamic ageDd;
  final String dobDate;
  final int paymodeNo;
  final String appointType;
  final List<dynamic> paymentArray;

  Appointment({
    required this.slotNo,
    required this.doctorNo,
    required this.doctorName,
    required this.appointDate,
    required this.shiftdtlNo,
    required this.shift,
    required this.slotSl,
    required this.startTime,
    required this.endTime,
    required this.durationMin,
    required this.extraSlot,
    required this.slotSplited,
    required this.ssCreator,
    required this.ssCreatedOn,
    required this.remarks,
    required this.appointStatus,
    required this.slotAppointStatus,
    required this.patientType,
    required this.consultationType,
    required this.opdConsultationFee,
    required this.companyNo,
    required this.hospitalNumber,
    required this.companyNameClass,
    required this.regNo,
    required this.patientName,
    required this.phoneMobile,
    required this.email,
    required this.dob,
    required this.gender,
    required this.address,
    required this.ageYy,
    required this.ageMm,
    required this.ageDd,
    required this.dobDate,
    required this.paymodeNo,
    required this.appointType,
    required this.paymentArray,
  });

  Appointment copyWith({
    String? slotNo,
    String? doctorNo,
    String? doctorName,
    String? appointDate,
    String? shiftdtlNo,
    String? shift,
    String? slotSl,
    String? startTime,
    String? endTime,
    String? durationMin,
    String? extraSlot,
    String? slotSplited,
    String? ssCreator,
    String? ssCreatedOn,
    String? remarks,
    int? appointStatus,
    String? slotAppointStatus,
    String? patientType,
    String? consultationType,
    String? opdConsultationFee,
    String? companyNo,
    String? hospitalNumber,
    String? companyNameClass,
    int? regNo,
    String? patientName,
    String? phoneMobile,
    dynamic email,
    String? dob,
    String? gender,
    String? address,
    int? ageYy,
    int? ageMm,
    dynamic ageDd,
    String? dobDate,
    int? paymodeNo,
    String? appointType,
    List<dynamic>? paymentArray,
  }) =>
      Appointment(
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
        patientType: patientType ?? this.patientType,
        consultationType: consultationType ?? this.consultationType,
        opdConsultationFee: opdConsultationFee ?? this.opdConsultationFee,
        companyNo: companyNo ?? this.companyNo,
        hospitalNumber: hospitalNumber ?? this.hospitalNumber,
        companyNameClass: companyNameClass ?? this.companyNameClass,
        regNo: regNo ?? this.regNo,
        patientName: patientName ?? this.patientName,
        phoneMobile: phoneMobile ?? this.phoneMobile,
        email: email ?? this.email,
        dob: dob ?? this.dob,
        gender: gender ?? this.gender,
        address: address ?? this.address,
        ageYy: ageYy ?? this.ageYy,
        ageMm: ageMm ?? this.ageMm,
        ageDd: ageDd ?? this.ageDd,
        dobDate: dobDate ?? this.dobDate,
        paymodeNo: paymodeNo ?? this.paymodeNo,
        appointType: appointType ?? this.appointType,
        paymentArray: paymentArray ?? this.paymentArray,
      );

  factory Appointment.fromJson(String str) =>
      Appointment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Appointment.fromMap(Map<String, dynamic> json) => Appointment(
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
        patientType: json["patientType"],
        consultationType: json["consultationType"],
        opdConsultationFee: json["opdConsultationFee"],
        companyNo: json["companyNo"],
        hospitalNumber: json["hospitalNumber"],
        companyNameClass: json["companyNameClass"],
        regNo: json["regNo"],
        patientName: json["patientName"],
        phoneMobile: json["phoneMobile"],
        email: json["email"],
        dob: json["dob"],
        gender: json["gender"],
        address: json["address"],
        ageYy: json["ageYy"],
        ageMm: json["ageMm"],
        ageDd: json["ageDd"],
        dobDate: json["dobDate"],
        paymodeNo: json["paymodeNo"],
        appointType: json["appointType"],
        paymentArray: List<dynamic>.from(json["paymentArray"].map((x) => x)),
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
        "patientType": patientType,
        "consultationType": consultationType,
        "opdConsultationFee": opdConsultationFee,
        "companyNo": companyNo,
        "hospitalNumber": hospitalNumber,
        "companyNameClass": companyNameClass,
        "regNo": regNo,
        "patientName": patientName,
        "phoneMobile": phoneMobile,
        "email": email,
        "dob": dob,
        "gender": gender,
        "address": address,
        "ageYy": ageYy,
        "ageMm": ageMm,
        "ageDd": ageDd,
        "dobDate": dobDate,
        "paymodeNo": paymodeNo,
        "appointType": appointType,
        "paymentArray": List<dynamic>.from(paymentArray.map((x) => x)),
      };
}
