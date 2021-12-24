import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class form_registro extends StatefulWidget {
  form_registro({Key? key}) : super(key: key);

  @override
  _form_registroState createState() => _form_registroState();
}

class _form_registroState extends State<form_registro> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade900,
      appBar: AppBar(
          leading: Icon(MdiIcons.hexagram),
          title: Text('Registro'),
          backgroundColor: Colors.green.shade900),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.green.shade600),
                child: Icon(MdiIcons.account),
                padding: EdgeInsets.all(10)),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: ListView(
                  children: [
                    campoUsuario(),
                    campoClave(),
                    campoEmail(),
                    botonRegistrar(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFormField campoUsuario() {
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'Usuario', icon: Icon(MdiIcons.accountArrowLeft)));
  }

  TextFormField campoClave() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Contraseña', icon: Icon(MdiIcons.accountKey)),
    );
  }

  TextFormField campoEmail() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Correo', icon: Icon(MdiIcons.cardAccountMail)),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget botonRegistrar() {
    return Container(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        child: Text('Registrar'),
        onPressed: () {},
      ),
    );
  }
}
