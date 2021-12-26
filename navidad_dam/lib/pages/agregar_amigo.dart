import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coolicons/coolicons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:navidad_dam/pages/amigo_page.dart';
import 'package:navidad_dam/service/firestore_service.dart';
import 'package:navidad_dam/util/nav.dart';

class AgregarAmigo extends StatefulWidget {
  final String userUID;
  final String amigoID;
  final String nombre;
  final String email;
  final String descripcion;
  final String profesion;

  AgregarAmigo(
      {this.userUID = '',
      this.amigoID = '',
      this.nombre = '',
      this.email = '',
      this.descripcion = '',
      this.profesion = ''});

  @override
  _AgregarAmigoState createState() => _AgregarAmigoState();
}

class _AgregarAmigoState extends State<AgregarAmigo> {
  final formKey = GlobalKey<FormState>();

  final correoValidator =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

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
      validator: (nombre) {
        if (nombre!.isEmpty) {
          return 'Ingrese el nombre del amigo';
        } else {
          return null;
        }
      },
    );
  }

  TextFormField campoEmailAmigo() {
    return TextFormField(
      controller: emailCtrl,
      decoration:
          InputDecoration(labelText: 'Correo', icon: Icon(Coolicons.mail_open)),
      validator: (correo) {
        if (correo!.isEmpty) {
          return 'Ingrese el correo del amigo';
        }
        if (!RegExp(correoValidator).hasMatch(correo)) {
          return 'ingrese un correo valido';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
    );
  }

  TextFormField campoDescripcion() {
    return TextFormField(
      controller: descripcionCtrl,
      decoration: InputDecoration(
          labelText: 'Descripcion', icon: Icon(MdiIcons.accountDetailsOutline)),
      validator: (descripcion) {
        if (descripcion!.isEmpty) {
          return 'Ingrese descripción de su amigo';
        } else {
          return null;
        }
      },
    );
  }

  TextFormField campoProfesion() {
    return TextFormField(
      controller: profesionCtrl,
      decoration: InputDecoration(
          labelText: 'Profesion', icon: Icon(MdiIcons.briefcase)),
      validator: (profesion) {
        if (profesion!.isEmpty) {
          return 'Ingrese la profesion de su amigo';
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
        child: Text(buttonText),
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            if (widget.amigoID != '') {
              try {
                print(await FirestoreService().amigosActualizar(
                    widget.amigoID,
                    nombreCtrl.text.trim(),
                    emailCtrl.text.trim(),
                    descripcionCtrl.text.trim(),
                    profesionCtrl.text.trim()));
                NavUtil.navigateTo(
                    context,
                    AmigoDetail(widget.amigoID, widget.userUID, widget.nombre,
                        widget.email, widget.descripcion, widget.profesion),
                    replacement: true);
              } on FirebaseAuthException catch (except) {
                print(except.code);
              }
            } else {
              try {
                print(await FirestoreService().amigosAgregar(
                    nombreCtrl.text.trim(),
                    emailCtrl.text.trim(),
                    descripcionCtrl.text.trim(),
                    profesionCtrl.text.trim()));
                Navigator.pop(context);
              } on FirebaseAuthException catch (except) {
                print(except.code);
              }
              print('Registrado');
            }
          }
        },
      ),
    );
  }
}
