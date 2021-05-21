import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:netgrow/Firebase/auth.dart';
import 'package:netgrow/Routes/Router.dart';
import 'package:netgrow/Routes/misArduino.dart';

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

  @override
  void initState() {
    _passwdVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _context = Theme.of(context);
    final _mq = MediaQuery.of(context);

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
          hintText: 'Ingrese su Contraseña',
          labelText: 'Contraseña',
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
          // TODO ACA VA EL LOGIN NO SIGN
          if (!_formKey.currentState!.validate()) return;
          try {
            await signUp(_emailController.text, _passwordController.text);
          } catch (e) {
            print(e);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('ERROR'),
              ),
            );
            return;
          }
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text('DONE'),
          //   ),
          // );
         NetGrowRouter.instance.push(MisArduino.route());
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
