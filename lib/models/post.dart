import 'package:faceapp/models/user.dart';

class Post {
  String description;
  String media;
  String id;
  User user;

  Post(
      {required this.description,
      required this.media,
      required this.id,
      required this.user});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        description: json['description'],
        media: json['media'],
        id: json['id'],
        user: User(
            id: json['user']["id"],
            name: json['user']["name"],
            email: json['user']["email"]));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['media'] = media;
    return data;
  }
}

class Media {
  String ext;
  String b64;

  Media({required this.ext, required this.b64});

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(ext: json['ext'], b64: json['b64']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ext'] = ext;
    data['b64'] = b64;
    return data;
  }
}
