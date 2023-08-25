import 'package:flutter/material.dart';
import 'database_helper.dart'; // Importa el archivo de database_helper.dart

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  DatabaseHelper _databaseHelper =
      DatabaseHelper(); // Instancia de DatabaseHelper

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 100, 3, 174),
                Color.fromARGB(255, 246, 251, 255),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _icon(),
              _inputFields(),
              _registerBtn(),
              _loginInfo(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon() {
    return Column(
      children: [
        const Icon(Icons.person, color: Colors.white, size: 150),
        Text(
          "Crea tu cuenta",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _inputFields() {
    return Container(
      color: Color.fromARGB(0, 102, 22, 22),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _textField("Usuario", usernameController),
            SizedBox(height: 10),
            _textField("Email", emailController),
            SizedBox(height: 10),
            _textField("Contraseña", passwordController, isPassword: true),
            SizedBox(height: 10),
            _textField("Confirmar Contraseña", confirmPasswordController,
                isPassword: true),
          ],
        ),
      ),
    );
  }

  Widget _textField(String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide(color: Colors.white),
    );

    return TextField(
      style: TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        enabledBorder: border,
        focusedBorder: border,
        filled: true,
        fillColor: Theme.of(context).primaryColor.withOpacity(0.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: isPassword,
    );
  }

  Widget _registerBtn() {
    return ElevatedButton(
      onPressed: () async {
        String username = usernameController.text;
        String email = emailController.text;
        String password = passwordController.text;
        String confirmPassword = confirmPasswordController.text;

        if (password == confirmPassword) {
          User newUser = User(
            id: 0,
            username: username,
            email: email,
            password: password,
          );

          await _databaseHelper.insertUser(newUser);

          debugPrint("Usuario registrado correctamente");
        } else {
          debugPrint("Las contraseñas no coinciden");
        }
      },
      child: Text(
        "Crear",
        style:
            TextStyle(fontSize: 20, color: Color.fromARGB(255, 138, 43, 226)),
      ),
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 190, vertical: 16),
        primary: Colors.white,
      ),
    );
  }

  Widget _loginInfo(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "¿Ya tienes una cuenta registrada?",
          style: TextStyle(color: Colors.white),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/LoginPage');
          },
          child: Text("Inicia sesión"),
        )
      ],
    );
  }
}


// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';

// class SignUpScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//           begin: Alignment.topRight,
//           end: Alignment.bottomLeft,
//           colors: [
//             Color.fromARGB(255, 100, 3, 174),
//             Color.fromARGB(255, 246, 251, 255),
//           ],
//         )),
//         child:
//             Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//           _header(context),
//           _inputFields(context),
//           _loginInfo(context),
//         ]),
//       ),
//     ));
//   }

//   _header(context) {
//     return Column(
//       children: [
//         const Icon(Icons.person, color: Colors.white, size: 150),
//         Text(
//           "Crea tu cuenta",
//           style: TextStyle(
//               fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
//           // selectionColor: Colors.white,
//         ),
//       ],
//       // children: [const Icon(Icons.person, color: Colors.white, size: 120)],
//     );
//   }

//   _inputFields(context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         TextField(
//           decoration: InputDecoration(
//             hintText: "Username",
//             fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
//             filled: true,
//             // prefixIcon: Icon(Icons.person),
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide.none),
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         TextField(
//           decoration: InputDecoration(
//             hintText: "Email id",
//             fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
//             filled: true,
//             // prefixIcon: Icon(Icons.email_outlined),
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(18),
//                 borderSide: BorderSide.none),
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         TextField(
//           decoration: InputDecoration(
//             hintText: "Password",
//             fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
//             filled: true,
//             // prefixIcon: Icon(Icons.password_outlined),
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(18),
//                 borderSide: BorderSide.none),
//           ),
//           obscureText: true,
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         TextField(
//           decoration: InputDecoration(
//             hintText: "Retype Password",
//             fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
//             filled: true,
//             // prefixIcon: Icon(Icons.password_outlined),
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(18),
//                 borderSide: BorderSide.none),
//           ),
//           obscureText: true,
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         ElevatedButton(
//           onPressed: () {
//             // if () {
//             //   print("Cuenta creada");
//             // } else {
//             //   print("Error");
//             // }
//           },
//           child: Text(
//             "Crear",
//             style: TextStyle(fontSize: 20),
//           ),
//           style: ElevatedButton.styleFrom(
//             shape: StadiumBorder(),
//             padding: EdgeInsets.symmetric(vertical: 16),
//           ),
//         )
//       ],
//     );
//   }

//   _loginInfo(context) {
//     return Row(

//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           "Ya tiene una cuenta registrada?",
//           style: TextStyle(color: Colors.white),
//           // selectionColor: Colors.white,
//         ),
//         TextButton(
//           onPressed: () {
//             Navigator.pushNamed(context, '/LoginPage');
//           },
//           child: Text("Incia sesion"),
//         )
//       ],
//     );
//   }
// }
