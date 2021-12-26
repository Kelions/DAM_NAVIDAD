import 'package:coolicons/coolicons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:navidad_dam/pages/user_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:navidad_dam/util/nav.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  String errorText = '';
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          child: Column(
            children: [
              TextFormField(
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
                  }),
              TextFormField(
                  controller: passwordCtrl,
                  decoration: InputDecoration(
                      labelText: 'Contraseña', icon: Icon(MdiIcons.accountKey)),
                  obscureText: true,
                  validator: (clave) {
                    if (clave!.isEmpty) {
                      return 'Ingrese descripción de su amigo';
                    } else {
                      return null;
                    }
                  }),
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
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: ElevatedButton(
        child: Text('Iniciar Sesion'),
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            print('Registrado');
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
