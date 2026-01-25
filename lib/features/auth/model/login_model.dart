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
  bool isFirstTimer;
  String accessToken;
  String refreshToken;

  Data({
    required this.user,
    required this.isFirstTimer,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    isFirstTimer: json["isFirstTimer"],
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "isFirstTimer": isFirstTimer,
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
  List<FcmToken> fcmTokens;
  String profileId;
  DateTime lastActiveAt;
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
    fcmTokens: List<FcmToken>.from(json["fcmTokens"].map((x) => FcmToken.fromJson(x))),
    profileId: json["profileId"],
    lastActiveAt: DateTime.parse(json["lastActiveAt"]),
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
    "fcmTokens": List<dynamic>.from(fcmTokens.map((x) => x.toJson())),
    "profileId": profileId,
    "lastActiveAt": lastActiveAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class FcmToken {
  String token;
  String deviceId;
  String platform;
  DateTime createdAt;

  FcmToken({
    required this.token,
    required this.deviceId,
    required this.platform,
    required this.createdAt,
  });

  factory FcmToken.fromJson(Map<String, dynamic> json) => FcmToken(
    token: json["token"],
    deviceId: json["deviceId"],
    platform: json["platform"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "deviceId": deviceId,
    "platform": platform,
    "createdAt": createdAt.toIso8601String(),
  };
}
