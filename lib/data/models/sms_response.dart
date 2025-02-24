import 'dart:convert';

class SmsResponse {
  final String? status;
  final String? text;
  final String? messageId;

  SmsResponse({
    this.status,
    this.text,
    this.messageId,
  });

  SmsResponse copyWith({
    String? status,
    String? text,
    String? messageId,
  }) =>
      SmsResponse(
        status: status ?? this.status,
        text: text ?? this.text,
        messageId: messageId ?? this.messageId,
      );

  factory SmsResponse.fromJson(String str) =>
      SmsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SmsResponse.fromMap(Map<String, dynamic> json) => SmsResponse(
        status: json["Status"],
        text: json["Text"],
        messageId: json["Message_ID"],
      );

  Map<String, dynamic> toMap() => {
        "Status": status,
        "Text": text,
        "Message_ID": messageId,
      };
}
