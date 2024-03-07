import 'dart:convert';

SignInResponse loginResponseFromJson(String str) => SignInResponse.fromJson(json.decode(str));

String loginResponseToJson(SignInResponse data) => json.encode(data.toJson());

class SignInResponse {
  String? code;
  bool? success;
  String? message;
  Data? data;

  SignInResponse({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
    code: json["code"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? accessToken;
  String? tokenType;
  String? refreshToken;
  UserData? user;

  Data({
    this.accessToken,
    this.tokenType,
    this.refreshToken,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json["accessToken"],
    tokenType: json["tokenType"],
    refreshToken: json["refreshToken"],
    user: json["user"] == null ? null : UserData.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "tokenType": tokenType,
    "refreshToken": refreshToken,
    "user": user?.toJson(),
  };
}

class UserData {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  bool? isEmailVerified;
  bool? isPhoneVerified;
  String? createdAt;
  String? updatedAt;
  String? profileImage;
  List<String>? deviceToken;

  UserData({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.isEmailVerified,
    this.isPhoneVerified,
    this.createdAt,
    this.updatedAt,
    this.profileImage,
    this.deviceToken,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phone: json["phone"],
    isEmailVerified: json["isEmailVerified"],
    isPhoneVerified: json["isPhoneVerified"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    profileImage: json["profileImage"],
    deviceToken: json["deviceToken"] == null ? [] : List<String>.from(json["deviceToken"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "isEmailVerified": isEmailVerified,
    "isPhoneVerified": isPhoneVerified,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "profileImage": profileImage,
    "deviceToken": deviceToken == null ? [] : List<dynamic>.from(deviceToken!.map((x) => x)),
  };
}
