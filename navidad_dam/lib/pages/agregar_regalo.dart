import 'package:flutter/material.dart';
import 'package:coolicons/coolicons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AgregarRegalo extends StatefulWidget {
  AgregarRegalo({Key? key}) : super(key: key);

  @override
  _AgregarRegaloState createState() => _AgregarRegaloState();
}

class _AgregarRegaloState extends State<AgregarRegalo> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(MdiIcons.gift),
        title: Text("Agregar Regalo"),
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
                      campoRegalo(),
                      campoDescripcion(),
                      campoValor(),
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

  TextFormField campoRegalo() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Regalo', icon: Icon(MdiIcons.giftOpen)),
    );
  }

  TextFormField campoDescripcion() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Descripción', icon: Icon(MdiIcons.renameBox)),
    );
  }

  TextFormField campoValor() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Valor Del Regalo', icon: Icon(MdiIcons.cash)),
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
