import 'package:faceapp/routes/feed/feed_view.dart';
import 'package:faceapp/routes/login/login_controller.dart';
import 'package:faceapp/routes/register/register_view.dart';
import 'package:flutter/material.dart';

class LoginViewPage extends StatelessWidget {
  static const String route = "/login";
  final _controller = LoginController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  LoginViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 37, 36, 102),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: ListView(
          children: [
            Icon(Icons.facebook_rounded, color: Colors.white, size: 178),
            //
            SizedBox(height: 55),
            //
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                border: OutlineInputBorder(),
                label: Text(
                  "Correo electronico:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            //
            SizedBox(height: 55),
            //
            TextField(
              obscureText: true, // Para dar formato de passwordfield
              controller: _passController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                label: Text(
                  "Contraseña:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            //
            SizedBox(height: 55),
            //
            SizedBox(
              height: 40,
              width: 100,
              child: ElevatedButton(
                  onPressed: () async {
                    if (_emailController.text.isEmpty ||
                        _passController.text.isEmpty) {
                      const snackBar = SnackBar(
                          content: Text("No se permiten campos vacios"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }
                    try {
                    await _controller.signIn(_emailController.text.trim(),
                        _passController.text.trim());
                    Navigator.pushNamed(context, FeedViewPage.route);
                    } catch (e) {
                      const snackBar = SnackBar(
                          content: Text("Error en usuario o contraseña"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text("Ingresar"),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.blue)),
            ),
            //
            SizedBox(height: 55),
            //
            SizedBox(
              height: 40,
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterViewPage.route);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text("Crear una cuenta nueva"),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.green)),
            )
          ],
        ),
      ),
    );
  }
}
