import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesion'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: emailCtrl,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: passwordCtrl,
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
              ),
              botonLogin(),
              Container(
                child: Text(errorText),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container botonLogin() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text('Iniciar Sesion'),
        onPressed: () async {
          UserCredential? userCredencial;
          try {
            userCredencial = await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: emailCtrl.text.trim(),
                    password: passwordCtrl.text.trim());
            SharedPreferences sp = await SharedPreferences.getInstance();
            sp.setString('user_email', emailCtrl.text.trim());
            // navigate to dashboard
          } on FirebaseAuthException catch (except) {
            switch (except.code) {
              case 'user-not-found':
                errorText = 'Usuario no encontrado';
                break;
              case 'wrong-password':
                errorText = 'Contraseña Incorrecta';
                break;
              default:
                errorText = 'Error: ' + except.code;
            }
            setState(() {});
          }
        },
      ),
    );
  }
}
