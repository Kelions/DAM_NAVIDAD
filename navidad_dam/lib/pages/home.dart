import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:navidad_dam/pages/form_login.dart';
import 'package:navidad_dam/pages/form_registro.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Home"),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Coolicons.home_heart),
                  text: "Iniciar Sesion",
                ),
                Tab(
                  icon: Icon(Coolicons.user_plus),
                  text: "Registrar",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [FormLogin(), form_registro()],
          ),
        ),
      ),
    );
  }
}
