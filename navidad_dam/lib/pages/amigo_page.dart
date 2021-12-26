import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nombre),
      ),
    );
  }
}
