import 'dart:convert';

class AuthResponse {
  final String? accessToken;
  final String? tokenType;
  final String? refreshToken;
  final int? expiresIn;
  final String? scope;
  final String? companyName;
  final String? name;
  final int? sessionNo;

  AuthResponse({
    this.accessToken,
    this.tokenType,
    this.refreshToken,
    this.expiresIn,
    this.scope,
    this.companyName,
    this.name,
    this.sessionNo,
  });

  AuthResponse copyWith({
    String? accessToken,
    String? tokenType,
    String? refreshToken,
    int? expiresIn,
    String? scope,
    String? companyName,
    String? name,
    int? sessionNo,
  }) =>
      AuthResponse(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        refreshToken: refreshToken ?? this.refreshToken,
        expiresIn: expiresIn ?? this.expiresIn,
        scope: scope ?? this.scope,
        companyName: companyName ?? this.companyName,
        name: name ?? this.name,
        sessionNo: sessionNo ?? this.sessionNo,
      );

  factory AuthResponse.fromJson(String str) =>
      AuthResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        refreshToken: json["refresh_token"],
        expiresIn: json["expires_in"],
        scope: json["scope"],
        companyName: json["companyName"],
        name: json["name"],
        sessionNo: json["sessionNo"],
      );

  Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "refresh_token": refreshToken,
        "expires_in": expiresIn,
        "scope": scope,
        "companyName": companyName,
        "name": name,
        "sessionNo": sessionNo,
      };
}
