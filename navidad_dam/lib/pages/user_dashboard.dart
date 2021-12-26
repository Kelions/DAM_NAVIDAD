import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coolicons/coolicons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:navidad_dam/constants.dart';
import 'package:navidad_dam/pages/form_login.dart';
import 'package:navidad_dam/service/firestore_service.dart';
import 'package:navidad_dam/util/nav.dart';
import 'package:navidad_dam/widgets/amigo_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                NavUtil.navigateTo(context, FormLogin(), replacement: true);
              },
              icon: Icon(
                Coolicons.log_out,
              ))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            color: kSecondaryColor,
            child: FutureBuilder(
              future: getUsuario(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Text('');
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Coolicons.mail,
                      color: kBackgroundColor,
                    ),
                    Text(
                      ' Usuario: ${snapshot.data}',
                      style: TextStyle(color: kBackgroundColor, fontSize: 16),
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirestoreService().amigos(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.separated(
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var amigo = snapshot.data!.docs[index];
                    return AmigoCard(
                      id: amigo.id,
                      nombre: amigo['nombre'],
                      email: amigo['email'],
                      descripcion: amigo['descripcion'],
                      profesion: amigo['profesion'],
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

Future<String> getUsuario() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  return sp.getString('user_email') ?? '';
}
