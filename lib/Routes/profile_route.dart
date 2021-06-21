import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netgrow/Routes/Router.dart';
import 'package:netgrow/Routes/login_route.dart';
import 'package:netgrow/Services/analytics.dart';
import 'package:netgrow/Services/auth.dart';

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
      body: StreamBuilder<User?>(
          stream: _auth.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            // Si snapshot no tiene data , aun esta cargando.
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            // Si el snapshot, tiene un error informar
            if (snapshot.hasError) {
              return Center(
                  child: Text("Error, no se pudo conectar",
                      style: Theme.of(context).textTheme.headline4));
            }
            // Pido el usario al snapshot
            final User? user = snapshot.data;

            final logoutBtn = Padding(
              padding: EdgeInsets.all(20.0),
              child: OutlinedButton(
                  onPressed: () async {
                    await _auth.singOut();
                    await _analytics.logLogout();
                    NetGrowRouter.instance.pushAndRemoveUntil(Login.route());
                  },
                  child: Text("Cerrar Sesion")),
            );

            return Column(
              children: <Widget>[
                if (user != null) Text("Perfil de ${user.displayName}"),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Placeholder(
                      // TODO AGREGAR UN AIMAGEN BONITA
                      fallbackHeight: MediaQuery.of(context).size.height / 3,
                      fallbackWidth: MediaQuery.of(context).size.width / 4,
                    ),
                  ),
                ),
                if (user != null && !user.emailVerified)
                  Padding(
                    padding: const EdgeInsets.all(12.0),
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
    );
  }
}
