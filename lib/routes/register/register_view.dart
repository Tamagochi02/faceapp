import 'package:faceapp/routes/login/login_view.dart';
import 'package:faceapp/routes/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterViewPage extends StatelessWidget {
  static const String route = "/register";
  final _controller = RegisterController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _passwordController1 = TextEditingController();
  final _passwordController2 = TextEditingController();

  RegisterViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Registro",
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginViewPage.route, (route) => false);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
          padding: EdgeInsets.all(40),
          child: ListView(
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                  label: Text(
                    "Correo electronico:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              //
              SizedBox(height: 45),
              //
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                  label: Text(
                    "Nombre(s):",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              //
              SizedBox(height: 45),
              //
              TextField(
                controller: _lastnameController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                  label: Text(
                    "Apellidos:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              //
              SizedBox(height: 45),
              //
              TextField(
                obscureText: true,
                controller: _passwordController1,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                  label: Text(
                    "Contraseña:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              //
              SizedBox(height: 45),
              //
              TextField(
                obscureText: true,
                controller: _passwordController2,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                  label: Text(
                    "Reescribe la contraseña:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              //
              SizedBox(height: 45),
              //
              SizedBox(
                height: 45,
                width: 140,
                child: ElevatedButton(
                    onPressed: () async {
                      String nombreCompleto = _nameController.text.trim() +
                          " " +
                          _lastnameController.text.trim();
                      if (_passwordController1.text !=
                          _passwordController2.text) {
                        const snackBar = SnackBar(
                            content: Text("Las contraseñas no coinciden"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        // return;
                      } else if (_nameController.text.isEmpty ||
                          _lastnameController.text.isEmpty ||
                          _emailController.text.isEmpty ||
                          _passwordController1.text.isEmpty ||
                          _passwordController2.text.isEmpty) {
                        const snackBar =
                            SnackBar(content: Text("Hay campos vacios"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        // return;
                      } else {
                        try {
                          await _controller.add(
                              nombreCompleto,
                              _emailController.text.trim(),
                              _passwordController1.text.trim());
                          Navigator.pop(context);
                        } catch (error) {
                          print(error.toString());
                        }
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child:
                          Text("Registrarme", style: TextStyle(fontSize: 17)),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.blue)),
              ),
            ],
          )),
    );
  }
}
