import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:navidad_dam/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:navidad_dam/pages/user_dashboard.dart';
import 'package:navidad_dam/util/nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

class form_registro extends StatefulWidget {
  form_registro({Key? key}) : super(key: key);

  @override
  _form_registroState createState() => _form_registroState();
}

class _form_registroState extends State<form_registro> {
  final formKey = GlobalKey<FormState>();
  final correoValidator =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              child: Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: ListView(
                    children: [
                      campoEmail(),
                      campoClave(),
                      botonRegistrar(),
                      Container(
                        child: Text(
                          errorText,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFormField campoClave() {
    return TextFormField(
      controller: passwordCtrl,
      decoration: InputDecoration(
          labelText: 'Contraseña', icon: Icon(MdiIcons.accountKey)),
      validator: (clave) {
        if (clave!.isEmpty) {
          return 'Ingrese Clave';
        } else {
          return null;
        }
      },
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
        }
        if (!RegExp(correoValidator).hasMatch(email)) {
          return 'Ingrese Email Valido';
        } else {
          return null;
        }
      },
    );
  }

  Widget botonRegistrar() {
    return Container(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        child: Text('Registrar'),
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            print('Registrado');
          }
          UserCredential? userCredential;
          try {
            userCredential = await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: emailCtrl.text.trim(),
                    password: passwordCtrl.text.trim());
            SharedPreferences sp = await SharedPreferences.getInstance();
            sp.setString('user_email', emailCtrl.text.trim());

            NavUtil.navigateTo(context, UserDashboard(), replacement: true);
          } on FirebaseAuthException catch (except) {
            switch (except.code) {
              case 'invalid-email':
                errorText = 'El correo ingresado es invalido';
                break;
              case 'weak-password':
                errorText =
                    'La contraseña ingresada es muy debil, por favor agregar mas caracteres y numeros';
                break;
              case 'email-already-in-use':
                errorText = 'Ya existe un usuario con ese correo';
                break;
              default:
                print(except.code);
            }
            setState(() {});
          }
        },
      ),
    );
  }
}
