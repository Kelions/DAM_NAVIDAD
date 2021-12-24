import 'package:flutter/material.dart';

import 'package:navidad_dam/pages/form_registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Regalos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: form_registro(),
    );
  }
}
