class UserData {
  String? Token;
  String? refreshToken;
  String? userName;
  String? lastLogin;
  String? userType;
  String? clientCodes;
  String? userId;

  UserData(
      {this.Token,
      this.refreshToken,
      this.userName,
      this.lastLogin,
      this.userType,
      this.clientCodes,
      this.userId});

  UserData.fromJson(Map<String, dynamic> json) {
    Token = json['Token'];
    refreshToken = json['RefreshToken'];
    userName = json['UserName'];
    lastLogin = json['LastLogin'];
    userType = json['UserType'];
    clientCodes = json['ClientCodes'];
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Token'] = this.Token;
    data['RefreshToken'] = this.refreshToken;
    data['UserName'] = this.userName;
    data['LastLogin'] = this.lastLogin;
    data['UserType'] = this.userType;
    data['ClientCodes'] = this.clientCodes;
    data['UserId'] = this.userId;
    return data;
  }
}
