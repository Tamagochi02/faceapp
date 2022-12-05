import 'package:faceapp/models/user.dart';

class Session {
  final String token;
  final User user;

  // SINGLETON:
  static Session? _session;

  Session._(this.token, this.user);

  factory Session.create(String token, User user) {
    return _session ??= Session._(token, user);
  }

  factory Session() {
    if (_session == null) throw "Sesion no encontrada";
    return _session!;
  }
}
