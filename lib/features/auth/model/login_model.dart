// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool success;
  String message;
  Data data;

  LoginModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  User user;
  String accessToken;
  String refreshToken;

  Data({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
}

class User {
  String id;
  String email;
  String status;
  bool isEmailVerified;
  String verificationCode;
  DateTime verificationCodeExpiry;
  String refreshToken;
  dynamic fcmTokens;
  String profileId;
  dynamic lastActiveAt;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.email,
    required this.status,
    required this.isEmailVerified,
    required this.verificationCode,
    required this.verificationCodeExpiry,
    required this.refreshToken,
    required this.fcmTokens,
    required this.profileId,
    required this.lastActiveAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    status: json["status"],
    isEmailVerified: json["isEmailVerified"],
    verificationCode: json["verificationCode"],
    verificationCodeExpiry: DateTime.parse(json["verificationCodeExpiry"]),
    refreshToken: json["refreshToken"],
    fcmTokens: json["fcmTokens"],
    profileId: json["profileId"],
    lastActiveAt: json["lastActiveAt"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "status": status,
    "isEmailVerified": isEmailVerified,
    "verificationCode": verificationCode,
    "verificationCodeExpiry": verificationCodeExpiry.toIso8601String(),
    "refreshToken": refreshToken,
    "fcmTokens": fcmTokens,
    "profileId": profileId,
    "lastActiveAt": lastActiveAt,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
