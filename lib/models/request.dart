import 'package:faceapp/models/user.dart';

class Request {
  String? id;
  User? userSource;
  User? userTarget;

  Request({this.id, this.userSource, this.userTarget});

  Request.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userSource = json['user_source'] != null
        ? new User.fromJson(json['user_source'])
        : null;
    userTarget = json['user_target'] != null
        ? new User.fromJson(json['user_target'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.userSource != null) {
      data['user_source'] = this.userSource!.toJson();
    }
    if (this.userTarget != null) {
      data['user_target'] = this.userTarget!.toJson();
    }
    return data;
  }
}
