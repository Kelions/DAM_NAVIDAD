import 'package:flutter/material.dart';
import 'package:navidad_dam/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class form_registro extends StatefulWidget {
  form_registro({Key? key}) : super(key: key);

  @override
  _form_registroState createState() => _form_registroState();
}

class _form_registroState extends State<form_registro> {
  final formKey = GlobalKey<FormState>();
  final correoValidator =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
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
                  padding: EdgeInsets.all(5),
                  child: ListView(
                    children: [
                      campoEmail(),
                      campoClave(),
                      botonRegistrar(),
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
      decoration: InputDecoration(
          labelText: 'Correo', icon: Icon(MdiIcons.cardAccountMail)),
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
        onPressed: () {
          if (formKey.currentState!.validate()) {
            print('Registrado');
          }
        },
      ),
    );
  }
}
