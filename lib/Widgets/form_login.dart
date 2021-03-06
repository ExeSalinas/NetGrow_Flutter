import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netgrow/Firebase/auth.dart';
import 'package:netgrow/Routes/Router.dart';
import 'package:netgrow/Routes/misArduino_route.dart';
import 'package:netgrow/Services/analytics.dart';
import 'package:netgrow/Services/auth.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _passwdVisible = true;
  final _paddingFormFields = EdgeInsets.all(8.0);
  final AnalyticsService _analyticsService = AnalyticsService();
  final AuthService _authService = AuthService.instance;

  @override
  void initState() {
    _passwdVisible = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _context = Theme.of(context);

    final _emailFormfield = TextFormField(
      controller: _emailController,
      key: Key("_emailFormfield"),
      keyboardType: TextInputType.emailAddress,
      style: _context.textTheme.headline6,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Ingrese su Email',
          labelText: 'Email'),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Por favor ingrese un email';
        if (!EmailValidator.validate(value)) {
          return 'Email no valido';
        }
        return null;
      },
    );

    final _passwdFormfield = TextFormField(
      controller: _passwordController,
      key: Key("_passwdFormfield"),
      style: _context.textTheme.headline6,
      obscureText: _passwdVisible,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Ingrese su Contrase??a',
          labelText: 'Contrase??a',
          suffixIcon: IconButton(
            icon:
                Icon(_passwdVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _passwdVisible = !_passwdVisible;
              });
            },
          )),
    );

    final _loginButton = Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        child: Text(
          "Ingresar",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async {
          if (!_formKey.currentState!.validate()) return;

          final User? user = await _authService.signInEmail(
              email: _emailController.text, password: _passwordController.text);
          if (user != null) {
            // logeo en analytics el evento de login , luego navego a esa ruta
            _analyticsService.logLogin("Email");
            _analyticsService.setUserProperties(
                userID: user.uid, userRol: "User");
            NetGrowRouter.instance.pushAndRemoveUntil(MisArduino.route());
          }
        },
      ),
    );

    final _form = Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode
          .onUserInteraction, // TODO VER SI LO DEJO ASI O VALIDO CON BOTON
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: _paddingFormFields,
            child: _emailFormfield,
          ),
          Padding(
            padding: _paddingFormFields,
            child: _passwdFormfield,
          ),
          _loginButton
        ],
      ),
    );
    return _form;
  }
}
