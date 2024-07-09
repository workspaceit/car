// To parse this JSON data, do
//
//     final authLoginResponse = authLoginResponseFromJson(jsonString);

import 'dart:convert';

AuthLoginResponse authLoginResponseFromJson(String str) => AuthLoginResponse.fromJson(json.decode(str));

String authLoginResponseToJson(AuthLoginResponse data) => json.encode(data.toJson());

class AuthLoginResponse {
  AuthLoginResponse({
    this.tokenType,
    this.expiresIn,
    this.accessToken,
    this.refreshToken,
  });

  String tokenType;
  int expiresIn;
  String accessToken;
  String refreshToken;

  factory AuthLoginResponse.fromJson(Map<String, dynamic> json) => AuthLoginResponse(
    tokenType: json["token_type"] == null ? null : json["token_type"],
    expiresIn: json["expires_in"] == null ? null : json["expires_in"],
    accessToken: json["access_token"] == null ? null : json["access_token"],
    refreshToken: json["refresh_token"] == null ? null : json["refresh_token"],
  );

  Map<String, dynamic> toJson() => {
    "token_type": tokenType == null ? null : tokenType,
    "expires_in": expiresIn == null ? null : expiresIn,
    "access_token": accessToken == null ? null : accessToken,
    "refresh_token": refreshToken == null ? null : refreshToken,
  };
}
