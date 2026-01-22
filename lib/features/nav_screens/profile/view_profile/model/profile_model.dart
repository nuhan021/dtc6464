// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  bool success;
  String message;
  Data data;

  ProfileModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
  String id;
  String email;
  String password;
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
  Profile profile;

  Data({
    required this.id,
    required this.email,
    required this.password,
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
    required this.profile,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    email: json["email"],
    password: json["password"],
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
    profile: Profile.fromJson(json["profile"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
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
    "profile": profile.toJson(),
  };
}

class Profile {
  String id;
  String fullName;
  String currentRole;
  String targetRole;
  List<String> targetCompany;
  String experienceLevel;
  List<String> careerGoals;
  List<String> strengths;
  List<String> weakAreas;
  String jobDescription;
  List<String> resumeUrls;
  ProfilePlan plan;
  String profilePictureId;
  ProfilePicture profilePicture;

  Profile({
    required this.id,
    required this.fullName,
    required this.currentRole,
    required this.targetRole,
    required this.targetCompany,
    required this.experienceLevel,
    required this.careerGoals,
    required this.strengths,
    required this.weakAreas,
    required this.jobDescription,
    required this.resumeUrls,
    required this.plan,
    required this.profilePictureId,
    required this.profilePicture,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    fullName: json["fullName"],
    currentRole: json["currentRole"],
    targetRole: json["targetRole"],
    targetCompany: List<String>.from(json["targetCompany"].map((x) => x)),
    experienceLevel: json["experienceLevel"],
    careerGoals: List<String>.from(json["careerGoals"].map((x) => x)),
    strengths: List<String>.from(json["strengths"].map((x) => x)),
    weakAreas: List<String>.from(json["weakAreas"].map((x) => x)),
    jobDescription: json["jobDescription"],
    resumeUrls: List<String>.from(json["resumeUrls"].map((x) => x)),
    plan: ProfilePlan.fromJson(json["plan"]),
    profilePictureId: json["profilePictureId"],
    profilePicture: ProfilePicture.fromJson(json["profilePicture"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "currentRole": currentRole,
    "targetRole": targetRole,
    "targetCompany": List<dynamic>.from(targetCompany.map((x) => x)),
    "experienceLevel": experienceLevel,
    "careerGoals": List<dynamic>.from(careerGoals.map((x) => x)),
    "strengths": List<dynamic>.from(strengths.map((x) => x)),
    "weakAreas": List<dynamic>.from(weakAreas.map((x) => x)),
    "jobDescription": jobDescription,
    "resumeUrls": List<dynamic>.from(resumeUrls.map((x) => x)),
    "plan": plan.toJson(),
    "profilePictureId": profilePictureId,
    "profilePicture": profilePicture.toJson(),
  };
}

class ProfilePlan {
  Roadmap roadmap;
  BenchmarkScore benchmarkScore;
  List<KeyFocusArea> keyFocusAreas;
  List<SampleQuestion> sampleQuestions;

  ProfilePlan({
    required this.roadmap,
    required this.benchmarkScore,
    required this.keyFocusAreas,
    required this.sampleQuestions,
  });

  factory ProfilePlan.fromJson(Map<String, dynamic> json) => ProfilePlan(
    roadmap: Roadmap.fromJson(json["roadmap"]),
    benchmarkScore: BenchmarkScore.fromJson(json["benchmark_score"]),
    keyFocusAreas: List<KeyFocusArea>.from(json["key_focus_areas"].map((x) => KeyFocusArea.fromJson(x))),
    sampleQuestions: List<SampleQuestion>.from(json["sample_questions"].map((x) => SampleQuestion.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "roadmap": roadmap.toJson(),
    "benchmark_score": benchmarkScore.toJson(),
    "key_focus_areas": List<dynamic>.from(keyFocusAreas.map((x) => x.toJson())),
    "sample_questions": List<dynamic>.from(sampleQuestions.map((x) => x.toJson())),
  };
}

class BenchmarkScore {
  int scale;
  double target;
  double current;

  BenchmarkScore({
    required this.scale,
    required this.target,
    required this.current,
  });

  factory BenchmarkScore.fromJson(Map<String, dynamic> json) => BenchmarkScore(
    scale: json["scale"],
    target: json["target"]?.toDouble(),
    current: json["current"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "scale": scale,
    "target": target,
    "current": current,
  };
}

class KeyFocusArea {
  String area;
  double progress;

  KeyFocusArea({
    required this.area,
    required this.progress,
  });

  factory KeyFocusArea.fromJson(Map<String, dynamic> json) => KeyFocusArea(
    area: json["area"],
    progress: json["progress"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "area": area,
    "progress": progress,
  };
}

class Roadmap {
  List<PlanElement> plan;
  Duration duration;

  Roadmap({
    required this.plan,
    required this.duration,
  });

  factory Roadmap.fromJson(Map<String, dynamic> json) => Roadmap(
    plan: List<PlanElement>.from(json["plan"].map((x) => PlanElement.fromJson(x))),
    duration: Duration.fromJson(json["duration"]),
  );

  Map<String, dynamic> toJson() => {
    "plan": List<dynamic>.from(plan.map((x) => x.toJson())),
    "duration": duration.toJson(),
  };
}

class Duration {
  String unit;
  int value;

  Duration({
    required this.unit,
    required this.value,
  });

  factory Duration.fromJson(Map<String, dynamic> json) => Duration(
    unit: json["unit"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "unit": unit,
    "value": value,
  };
}

class PlanElement {
  String focus;
  int phase;

  PlanElement({
    required this.focus,
    required this.phase,
  });

  factory PlanElement.fromJson(Map<String, dynamic> json) => PlanElement(
    focus: json["focus"],
    phase: json["phase"],
  );

  Map<String, dynamic> toJson() => {
    "focus": focus,
    "phase": phase,
  };
}

class SampleQuestion {
  String text;
  String type;

  SampleQuestion({
    required this.text,
    required this.type,
  });

  factory SampleQuestion.fromJson(Map<String, dynamic> json) => SampleQuestion(
    text: json["text"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "type": type,
  };
}

class ProfilePicture {
  String id;
  String fileName;
  String fileUrl;
  String mimeType;
  int fileSize;
  bool isDefault;
  DateTime uploadedAt;
  DateTime updatedAt;

  ProfilePicture({
    required this.id,
    required this.fileName,
    required this.fileUrl,
    required this.mimeType,
    required this.fileSize,
    required this.isDefault,
    required this.uploadedAt,
    required this.updatedAt,
  });

  factory ProfilePicture.fromJson(Map<String, dynamic> json) => ProfilePicture(
    id: json["id"],
    fileName: json["fileName"],
    fileUrl: json["fileUrl"],
    mimeType: json["mimeType"],
    fileSize: json["fileSize"],
    isDefault: json["isDefault"],
    uploadedAt: DateTime.parse(json["uploadedAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fileName": fileName,
    "fileUrl": fileUrl,
    "mimeType": mimeType,
    "fileSize": fileSize,
    "isDefault": isDefault,
    "uploadedAt": uploadedAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
