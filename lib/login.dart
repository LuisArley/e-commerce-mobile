import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

// import 'Regist.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String desiredUsername = "user";
  String desiredPassword = "user";

  Future login() async {
    var url = "https://api-android.herokuapp.com/";
    var response = await http.post(url as Uri, body: {
      "username": usernameController.text,
      'password': passwordController.text,
    });

    var data = json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color.fromARGB(255, 246, 251, 255),
          Color.fromARGB(255, 100, 3, 174),
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            const SizedBox(height: 50),
            _inputField("Usuario", usernameController),
            const SizedBox(height: 20),
            _inputField("Contraseña", passwordController, isPassword: true),
            const SizedBox(height: 50),
            _loginBtn(),
            const SizedBox(height: 20),
            _extraText(),
            const SizedBox(height: 20),
            _extraText1(context),
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 2),
          shape: BoxShape.circle),
      child: const Icon(Icons.person, color: Colors.white, size: 120),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.white));

    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () {
        String enteredUsername = usernameController.text;
        String enteredPassword = passwordController.text;

        // Aquí puedes agregar la lógica de validación de usuario y contraseña.
        // Por ejemplo, comparar con valores predefinidos.
        if (enteredUsername == desiredUsername &&
            enteredPassword == desiredPassword) {
          // Acceso permitido - realizar alguna acción, como navegación a otra pantalla.
          debugPrint("Acceso permitido");
          Navigator.pushNamed(context, '/InfoPage');
          // Agregar aquí la navegación a la siguiente pantalla, por ejemplo:
          // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
        } else {
          // Acceso denegado - mostrar mensaje de error.
          debugPrint("Credenciales incorrectas");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Credenciales incorrectas')),
          );
        }
      },
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Iniciar",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        primary: Colors.white,
        onPrimary: Color.fromARGB(255, 100, 3, 174),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _extraText() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/SignUpScreen');
      },
      child: Text(
        "Registrate",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}

Widget _extraText1(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/InfoPage');
    },
    child: Text(
      "Continuar(Beta)",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
  );
}
