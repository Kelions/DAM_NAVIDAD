import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:navidad_dam/pages/agregar_regalo.dart';
import 'package:navidad_dam/util/nav.dart';

class RegaloCard extends StatelessWidget {
  final String id;
  final String amigo_id;
  final String idea;
  final String descripcion;
  final String tienda;
  final int valor;

  RegaloCard(this.id, this.amigo_id, this.idea, this.descripcion, this.tienda,
      this.valor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavUtil.navigateTo(
            context,
            AgregarRegalo(amigo_id,
                id: id,
                descripcion: descripcion,
                regalo: idea,
                valor: valor,
                tienda: tienda));
      },
      child: Card(
        child: ListTile(
            leading: Icon(MdiIcons.gift),
            title: Text(idea),
            subtitle: Text(descripcion),
            trailing: Text('\$ ${valor}')),
      ),
    );
  }
}
