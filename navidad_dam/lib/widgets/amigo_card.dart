import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';
import 'package:navidad_dam/pages/amigo_page.dart';
import 'package:navidad_dam/util/nav.dart';

class AmigoCard extends StatelessWidget {
  final String id;
  final String nombre;
  final String email;
  final String descripcion;
  final String profesion;

  AmigoCard(
      {this.id = 'default',
      this.nombre = 'default',
      this.email = 'default',
      this.descripcion = 'default',
      this.profesion = 'default'});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavUtil.navigateTo(
          context, AmigoDetail(id, nombre, email, descripcion, profesion)),
      child: Card(
        child: ListTile(
          leading: const Icon(Coolicons.user),
          title: Text(nombre),
          subtitle: Text(profesion),
          trailing: Text('Regalos: '),
        ),
      ),
    );
  }
}
