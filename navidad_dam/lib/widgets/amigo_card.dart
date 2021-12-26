import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';
import 'package:navidad_dam/pages/amigo_page.dart';
import 'package:navidad_dam/service/firestore_service.dart';
import 'package:navidad_dam/util/nav.dart';

class AmigoCard extends StatelessWidget {
  final String id;
  final String usuarioUID;
  final String nombre;
  final String email;
  final String descripcion;
  final String profesion;

  AmigoCard(
      {this.id = 'default',
      this.usuarioUID = 'default',
      this.nombre = 'default',
      this.email = 'default',
      this.descripcion = 'default',
      this.profesion = 'default'});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreService().regalos(id),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData ||
            snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        int cantidad = snapshot.data!.docs.length;

        return GestureDetector(
          onTap: () => NavUtil.navigateTo(
              context,
              AmigoDetail(
                  id, usuarioUID, nombre, email, descripcion, profesion)),
          child: Card(
              child: ListTile(
                  leading: const Icon(Coolicons.user),
                  title: Text(nombre),
                  subtitle: Text(profesion),
                  trailing: Text('Regalos: ${cantidad}'))),
        );
      },
    );
  }
}
