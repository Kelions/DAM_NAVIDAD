import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:navidad_dam/constants.dart';
import 'package:navidad_dam/service/firestore_service.dart';
import 'package:navidad_dam/widgets/regalo_card.dart';

class AmigoDetail extends StatefulWidget {
  final String id;
  final String nombre;
  final String email;
  final String descripcion;
  final String profesion;

  const AmigoDetail(
      this.id, this.nombre, this.email, this.descripcion, this.profesion);

  @override
  _AmigoDetailState createState() => _AmigoDetailState();
}

class _AmigoDetailState extends State<AmigoDetail> {
  final TextStyle infoStyle = TextStyle(
    fontSize: 18,
    color: kBackgroundColor,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nombre),
        actions: [
          IconButton(
              onPressed: () async {
                await FirestoreService().amigosBorrar(widget.id);
                Navigator.pop(context);
              },
              icon: Icon(Coolicons.trash_full))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            color: kSecondaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Coolicons.user,
                      color: kBackgroundColor,
                    ),
                    Text(
                      ' ${widget.nombre}',
                      style: infoStyle,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Coolicons.mail,
                      color: kBackgroundColor,
                    ),
                    Text(
                      ' ${widget.email}',
                      style: infoStyle,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Coolicons.text_align_center,
                      color: kBackgroundColor,
                    ),
                    Text(
                      ' ${widget.descripcion}',
                      style: infoStyle,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      MdiIcons.briefcase,
                      color: kBackgroundColor,
                    ),
                    Text(
                      ' ${widget.profesion}',
                      style: infoStyle,
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: StreamBuilder(
            stream: FirestoreService().regalos(widget.id),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var regalo = snapshot.data!.docs[index];
                  return RegaloCard(regalo.id, widget.id, regalo['idea'],
                      regalo['descripcion'], regalo['tienda'], regalo['valor']);
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
