import 'package:flutter/material.dart';
import 'package:navidad_dam/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:navidad_dam/pages/agregar_regalo.dart';
import 'package:navidad_dam/pages/home.dart';
import 'package:navidad_dam/pages/form_registro.dart';
import 'package:navidad_dam/pages/form_login.dart';
import 'package:navidad_dam/pages/agregar_amigo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Regalos',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
        background: kBackgroundColor,
      )),
      home: AgregarAmigo(),
    );
  }
}
