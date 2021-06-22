import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netgrow/Routes/Router.dart';
import 'package:netgrow/Routes/forgotPassword_route.dart';
import 'package:netgrow/Widgets/background.dart';
import 'package:netgrow/Widgets/form_createUser.dart';
import 'package:netgrow/Widgets/form_login.dart';

class Login extends StatefulWidget {
  static final id = "Login";
  static Route<Login> route() {
    return MaterialPageRoute<Login>(
        settings: RouteSettings(name: id),
        builder: (BuildContext context) => Login());
  }

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final _mq = MediaQuery.of(context);
    final _registerButton = TextButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: _mq.size.width * 0.6,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CreateUserForm(),
                      )),
                );
              });
        },
        child: Text("Crear un usuario"));

    final _forgotPasswdBtn = Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
            onPressed: () {
              NetGrowRouter.instance.push(ForgotPassword.route());
            },
            child: Text("Olvide mi contraseña")),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent.shade100,
      body: SafeArea(
        child: Background(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [LoginForm(), _registerButton, _forgotPasswdBtn],
          ),
        ),
      ),
    );
  }
}
