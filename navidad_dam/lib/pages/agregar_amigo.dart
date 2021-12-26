import 'package:flutter/material.dart';
import 'package:coolicons/coolicons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AgregarAmigo extends StatefulWidget {
  AgregarAmigo({Key? key}) : super(key: key);

  @override
  _AgregarAmigoState createState() => _AgregarAmigoState();
}

class _AgregarAmigoState extends State<AgregarAmigo> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Icon(Coolicons.user_heart),
          Text("Agregar amigo"),
        ]),
        centerTitle: true,
      ),
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
                      campoNombre(),
                      campoEmailAmigo(),
                      campoDescripcion(),
                      campoProfesion(),
                      botonRegistrar()
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

  TextFormField campoNombre() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Nombre', icon: Icon(MdiIcons.renameBox)),
    );
  }

  TextFormField campoEmailAmigo() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Correo', icon: Icon(Coolicons.mail_open)),
      keyboardType: TextInputType.emailAddress,
    );
  }

  TextFormField campoDescripcion() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Descripcion', icon: Icon(MdiIcons.accountDetailsOutline)),
    );
  }

  TextFormField campoProfesion() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Profesion', icon: Icon(MdiIcons.briefcase)),
    );
  }

  Widget botonRegistrar() {
    return Container(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        child: Text('Agregar'),
        onPressed: () {},
      ),
    );
  }
}
