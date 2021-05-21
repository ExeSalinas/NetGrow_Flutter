import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  // TODO MOVER A FIREBASE
  String backgroundImg =
      r"https://images.unsplash.com/photo-1477768663691-75454fd8e870?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1534&q=80";

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

    return Scaffold(
      backgroundColor: Colors.lightGreenAccent.shade100,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: _mq.size.height,
              width: _mq.size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(backgroundImg, scale: 1.0),
                ),
              ),
              padding: EdgeInsets.all(40.0),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(
                        Radius.circular(_mq.size.width * 0.03))),
                width:
                    (_mq.size.width * 0.45 > 400) ? _mq.size.width * 0.5 : 400,
                padding: EdgeInsets.all(20.0),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: _mq.size.width * 0.05,
                    vertical: _mq.size.height * 0.05,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [LoginForm(), _registerButton],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
