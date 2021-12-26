import 'package:flutter/material.dart';
import 'package:coolicons/coolicons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:navidad_dam/service/firestore_service.dart';

class AgregarAmigo extends StatefulWidget {
  final String amigoID;
  final String nombre;
  final String email;
  final String descripcion;
  final String profesion;

  AgregarAmigo(
      {this.amigoID = '',
      this.nombre = '',
      this.email = '',
      this.descripcion = '',
      this.profesion = ''});

  @override
  _AgregarAmigoState createState() => _AgregarAmigoState();
}

class _AgregarAmigoState extends State<AgregarAmigo> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController descripcionCtrl = TextEditingController();
  TextEditingController profesionCtrl = TextEditingController();

  String titleText = 'Agregar Amigo';
  String buttonText = 'Agregar';

  @override
  Widget build(BuildContext context) {
    if (widget.amigoID != '') {
      nombreCtrl.text = widget.nombre;
      emailCtrl.text = widget.email;
      descripcionCtrl.text = widget.descripcion;
      profesionCtrl.text = widget.profesion;

      titleText = 'Editar Amigo';
      buttonText = 'Guardar';
    }
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Icon(Coolicons.user_heart),
          Text(titleText),
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
      controller: nombreCtrl,
      decoration:
          InputDecoration(labelText: 'Nombre', icon: Icon(MdiIcons.renameBox)),
    );
  }

  TextFormField campoEmailAmigo() {
    return TextFormField(
      controller: emailCtrl,
      decoration:
          InputDecoration(labelText: 'Correo', icon: Icon(Coolicons.mail_open)),
      keyboardType: TextInputType.emailAddress,
    );
  }

  TextFormField campoDescripcion() {
    return TextFormField(
      controller: descripcionCtrl,
      decoration: InputDecoration(
          labelText: 'Descripcion', icon: Icon(MdiIcons.accountDetailsOutline)),
    );
  }

  TextFormField campoProfesion() {
    return TextFormField(
      controller: profesionCtrl,
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
