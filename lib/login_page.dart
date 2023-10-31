import 'package:flutter/material.dart';
import 'package:tempo_app/home_screen.dart';
import 'package:url_launcher/url_launcher.dart'; // Importar el paquete para el lanzamiento de URL

class Login extends StatefulWidget {
  static String id = 'login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 72, 165, 144),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login', // Título "Login"
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0), // Espacio entre el título y la imagen
              Image.asset(
                'assets/img/logo.png',
                height: 300.0,
              ),
              SizedBox(
                height: 15.0,
              ),
              _userTextField(),
              SizedBox(
                height: 15.0,
              ),
              _passwordTextField(),
              SizedBox(
                height: 20.0,
              ),
              _loginButton(), // Cambio de nombre de método
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  _launchGmail(); // Abre la página de Gmail al tocar el texto
                },
                child: Text(
                  '¿Olvidó su contraseña?', // Texto interactivo
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: _userController, // Asigna el controlador al TextField
        style: TextStyle(color: Colors.white),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            color: Color.fromARGB(255, 248, 248, 248),
          ),
          hintText: 'Ingrese su matricula',
          labelText: 'Matricula',
          hintStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white),
        ),
        onChanged: (value) {},
      ),
    );
  }

  Widget _passwordTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: _passwordController, // Asigna el controlador al TextField
        style: TextStyle(color: Colors.white),
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: Color.fromARGB(255, 248, 248, 248),
          ),
          hintText: 'Ingrese su Contraseña',
          labelText: 'Contraseña',
          hintStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white),
        ),
        onChanged: (value) {},
      ),
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: Text(
          'Ingresar',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 8.0,
        primary: const Color.fromARGB(255, 37, 37, 37),
      ),
    );
  }

  // Método para abrir la página de Gmail
  _launchGmail() async {
    const url = 'https://mail.google.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir la URL: $url';
    }
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
