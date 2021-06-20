
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  static String id = 'Profile';
  static Route<Profile> route() {
    return MaterialPageRoute<Profile>(
      settings: RouteSettings(name: id),
      builder: (BuildContext context) => Profile(),
    );
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          // TODO, poner el nombre del usuario
          "MI PERFIL",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Center(child: Placeholder()),
    );
  }
}
