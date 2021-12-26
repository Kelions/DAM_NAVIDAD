import 'package:coolicons/coolicons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:navidad_dam/constants.dart';
import 'package:navidad_dam/pages/user_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:navidad_dam/util/nav.dart';

class FormLogin extends StatefulWidget {
  FormLogin({Key? key}) : super(key: key);

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              campoEmail(),
              campoClave(),
              botonLogin(),
              Container(
                child: Text(
                  errorText,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField campoEmail() {
    return TextFormField(
        controller: emailCtrl,
        decoration: InputDecoration(
            labelText: 'Email', icon: Icon(MdiIcons.cardAccountMail)),
        keyboardType: TextInputType.emailAddress,
        validator: (email) {
          if (email!.isEmpty) {
            return 'Ingrese Email';
          } else {
            return null;
          }
        });
  }

  TextFormField campoClave() {
    return TextFormField(
        controller: passwordCtrl,
        decoration: InputDecoration(
            labelText: 'Contraseña', icon: Icon(MdiIcons.accountKey)),
        obscureText: true,
        validator: (clave) {
          if (clave!.isEmpty) {
            return 'Debe ingresar una contraseña';
          } else {
            return null;
          }
        });
  }

  Widget botonLogin() {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: ElevatedButton(
        child: Text('Iniciar Sesion'),
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            print('Signed in');
          }
          UserCredential? userCredencial;
          try {
            userCredencial = await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: emailCtrl.text.trim(),
                    password: passwordCtrl.text.trim());
            SharedPreferences sp = await SharedPreferences.getInstance();
            sp.setString('user_email', emailCtrl.text.trim());
            // navigate to dashboard
            NavUtil.navigateTo(context, UserDashboard(), replacement: true);
          } on FirebaseAuthException catch (except) {
            switch (except.code) {
              case 'user-not-found':
                errorText = 'Usuario no encontrado';
                break;
              case 'wrong-password':
                errorText = 'Contraseña Incorrecta';
                break;
              case 'invalid-password':
                errorText = 'La contraseña ingrsada no es valida';
                break;
              case 'invalid-email':
                errorText = 'El email ingresado no es valido';
                break;
              default:
                print('Error ${except.code}');
            }
            setState(() {});
          }
        },
      ),
    );
  }
}
