class LoginModel {
  String email;
  String icon;
  int id;
  String nickname;
  String password;
  String publicName;
  String token;
  int type;
  String username;
  bool admin;
  List<dynamic> collectIds;
  LoginModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        icon = json['icon'],
        id = json['id'],
        nickname = json['nickname'],
        password = json['password'],
        publicName = json['publicName'],
        token = json['token'],
        type = json['type'],
        username = json['username'],
        admin = json['admin'],
        collectIds = json['collectIds'];
}
