import 'package:flutter/material.dart';
import 'package:coolicons/coolicons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AgregarRegalo extends StatefulWidget {
  final String amigoID;
  final String id;
  final String regalo;
  final String descripcion;
  final int valor;
  final String tienda;

  AgregarRegalo(this.amigoID,
      {this.id = '',
      this.descripcion = '',
      this.regalo = '',
      this.valor = 0,
      this.tienda = ''});

  @override
  _AgregarRegaloState createState() => _AgregarRegaloState();
}

class _AgregarRegaloState extends State<AgregarRegalo> {
  final formKey = GlobalKey<FormState>();

  TextEditingController regaloCtrl = TextEditingController();
  TextEditingController descripcionCtrl = TextEditingController();
  TextEditingController valorCtrl = TextEditingController();
  TextEditingController tiendaCtrl = TextEditingController();

  String titleText = 'Agregar Regalo';
  String buttonText = 'Agregar';

  @override
  Widget build(BuildContext context) {
    if (widget.id != '') {
      regaloCtrl.text = widget.regalo;
      descripcionCtrl.text = widget.descripcion;
      valorCtrl.text = widget.valor.toString();
      tiendaCtrl.text = widget.tienda;
    }
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [Icon(MdiIcons.gift), Text(titleText)]),
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
                      campoTienda(),
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
      controller: regaloCtrl,
      decoration:
          InputDecoration(labelText: 'Regalo', icon: Icon(MdiIcons.giftOpen)),
      validator: (regalo) {
        if (regalo!.isEmpty) {
          return 'Ingrese Regalo';
        } else {
          return null;
        }
      },
    );
  }

  TextFormField campoDescripcion() {
    return TextFormField(
      controller: descripcionCtrl,
      decoration: InputDecoration(
          labelText: 'Descripción', icon: Icon(MdiIcons.renameBox)),
      validator: (descripcion) {
        if (descripcion!.isEmpty) {
          return 'Ingrese Descripcion';
        } else {
          return null;
        }
      },
    );
  }

  TextFormField campoValor() {
    return TextFormField(
      controller: valorCtrl,
      decoration: InputDecoration(
          labelText: 'Valor Del Regalo', icon: Icon(MdiIcons.cash)),
      validator: (valor) {
        if (valor!.isEmpty) {
          return 'Ingrese Valor del regalo';
        } else {
          return null;
        }
      },
    );
  }

  TextFormField campoTienda() {
    return TextFormField(
      controller: tiendaCtrl,
      decoration: InputDecoration(
          labelText: 'Tienda', icon: Icon(MdiIcons.officeBuildingCogOutline)),
      validator: (tienda) {
        if (tienda!.isEmpty) {
          return 'Ingrese Tienda del Regalo';
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
        child: Text('Agregar'),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            print('Registrado');
          }
        },
      ),
    );
  }
}
