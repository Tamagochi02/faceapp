class Post2 {
  String? description;
  Media? media;

  Post2({this.description, this.media});

  Post2.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    if (this.media != null) {
      data['media'] = this.media!.toJson();
    }
    return data;
  }
}

class Media {
  String? ext;
  String? b64;

  Media({this.ext, this.b64});

  Media.fromJson(Map<String, dynamic> json) {
    ext = json['ext'];
    b64 = json['b64'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ext'] = this.ext;
    data['b64'] = this.b64;
    return data;
  }
}
