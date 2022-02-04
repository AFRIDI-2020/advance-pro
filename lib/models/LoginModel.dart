import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.successResonse,
    this.failedResponse,
    this.twoFactorEnabled,
    this.twoFactorCodeSent,
    this.twoFactorCodeValidated,
  });

  SuccessResonse? successResonse;
  dynamic failedResponse;
  bool? twoFactorEnabled;
  bool? twoFactorCodeSent;
  bool? twoFactorCodeValidated;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    successResonse: SuccessResonse.fromJson(json["successResonse"]),
    failedResponse: json["failedResponse"],
    twoFactorEnabled: json["twoFactorEnabled"],
    twoFactorCodeSent: json["twoFactorCodeSent"],
    twoFactorCodeValidated: json["twoFactorCodeValidated"],
  );

  Map<String, dynamic> toJson() => {
    "successResonse": successResonse?.toJson(),
    "failedResponse": failedResponse,
    "twoFactorEnabled": twoFactorEnabled,
    "twoFactorCodeSent": twoFactorCodeSent,
    "twoFactorCodeValidated": twoFactorCodeValidated,
  };
}

class SuccessResonse {
  SuccessResonse({
    this.token,
    this.refreshToken,
    this.user,
    this.isAptxAdminSetupCompleted,
    this.isCompanySetupCompleted,
    this.hasAnyPackage,
  });

  String? token;
  String? refreshToken;
  User? user;
  bool? isAptxAdminSetupCompleted;
  bool? isCompanySetupCompleted;
  bool? hasAnyPackage;

  factory SuccessResonse.fromJson(Map<String, dynamic> json) => SuccessResonse(
    token: json["token"],
    refreshToken: json["refreshToken"],
    user: User.fromJson(json["user"]),
    isAptxAdminSetupCompleted: json["isAPTXAdminSetupCompleted"],
    isCompanySetupCompleted: json["isCompanySetupCompleted"],
    hasAnyPackage: json["hasAnyPackage"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "refreshToken": refreshToken,
    "user": user?.toJson(),
    "isAPTXAdminSetupCompleted": isAptxAdminSetupCompleted,
    "isCompanySetupCompleted": isCompanySetupCompleted,
    "hasAnyPackage": hasAnyPackage,
  };
}

class User {
  User({
    this.userId,
    this.firstName,
    this.lastName,
    this.userName,
    this.role,
    this.emailConfirmed,
    this.companyId,
    this.packageId,
    this.packageName,
  });

  int? userId;
  String? firstName;
  String? lastName;
  String? userName;
  String? role;
  bool? emailConfirmed;
  int? companyId;
  int? packageId;
  dynamic packageName;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["userID"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    userName: json["userName"],
    role: json["role"],
    emailConfirmed: json["emailConfirmed"],
    companyId: json["companyId"],
    packageId: json["packageId"],
    packageName: json["packageName"],
  );

  Map<String, dynamic> toJson() => {
    "userID": userId,
    "firstName": firstName,
    "lastName": lastName,
    "userName": userName,
    "role": role,
    "emailConfirmed": emailConfirmed,
    "companyId": companyId,
    "packageId": packageId,
    "packageName": packageName,
  };
}
