import 'package:conectacontea/app/routes/landing_page.dart';
import 'package:conectacontea/app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  void onSignOut(BuildContext context) {
    final auth = Provider.of<FirebaseAuthentication>(context, listen: false);
    auth.signOut();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LandingPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Cerrar sesión'),
            onTap: () => onSignOut(context),
          )
        ],
      ),
    );
  }
}
