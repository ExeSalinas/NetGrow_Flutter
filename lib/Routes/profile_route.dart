import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netgrow/Routes/Router.dart';
import 'package:netgrow/Routes/login_route.dart';
import 'package:netgrow/Services/analytics.dart';
import 'package:netgrow/Services/auth.dart';
import 'package:netgrow/Widgets/background.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  static String id = 'Profile';
  static Route<Profile> route() {
    return MaterialPageRoute<Profile>(
      settings: RouteSettings(name: id),
      builder: (BuildContext context) => Profile(),
    );
  }

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  static const String _imgURL =
      r"https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=80";

  @override
  Widget build(BuildContext context) {
    // vamos a susbscribirnos a state changes , de forma que podamos reflejar
    // en el perfl los cambios en la cuenta , ejemplo que confirme el email
    final _auth = AuthService.instance;
    final _analytics = AnalyticsService.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text(" Mi Perfil"),
        centerTitle: true,
      ),
      body: Background(
        child: StreamBuilder<User?>(
            stream: _auth.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
              // Si snapshot no tiene data , aun esta cargando.
              if (!snapshot.hasData) {
                return Center(
                    child: Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width / 3,
                        child: CircularProgressIndicator()));
              }
              // Si el snapshot, tiene un error informar
              if (snapshot.hasError) {
                return Center(
                    child: Text("Error, no se pudo conectar",
                        style: Theme.of(context).textTheme.headline2));
              }
              // Pido el usario al snapshot
              final User? user = snapshot.data;

              final logoutBtn = Padding(
                padding: EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () async {
                      await _auth.singOut();
                      await _analytics.logLogout();
                      NetGrowRouter.instance.pushAndRemoveUntil(Login.route());
                    },
                    child: Text("Cerrar Sesion")),
              );

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (user != null)
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "${user.email}",
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                          vertical: MediaQuery.of(context).size.height * 0.02),
                      child: Image.network(_imgURL,
                          fit: BoxFit.scaleDown,
                          width: MediaQuery.of(context).size.width * 0.75),
                    ),
                  ),
                  if (user != null && !user.emailVerified)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            user.sendEmailVerification();
                          },
                          child: Text("Verifica tu email"),
                        ),
                      ),
                    ),
                  logoutBtn
                ],
              );
            }),
      ),
    );
  }
}
