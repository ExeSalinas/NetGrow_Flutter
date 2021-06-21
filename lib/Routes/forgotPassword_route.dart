import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:netgrow/Services/auth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  static final id = "ForgotPassword";
  static Route<ForgotPassword> route() {
    return MaterialPageRoute<ForgotPassword>(
        settings: RouteSettings(name: id),
        builder: (BuildContext context) => ForgotPassword());
  }

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _auth = AuthService.instance;

  @override
  Widget build(BuildContext context) {
    final _emailFormfield = TextFormField(
      controller: _emailController,
      key: Key("_emailFormfield"),
      keyboardType: TextInputType.emailAddress,
      style: Theme.of(context).textTheme.headline6,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Ingrese su Email',
          labelText: 'Email'),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Ingresa tu email';
        if (!EmailValidator.validate(value)) {
          return 'Email no valido';
        }
        return null;
      },
    );

    final _button = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 18,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        child: Text(
          "Enviar Código de verificacion",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          if (!_formKey.currentState!.validate()) return;
          _auth.forgotPassword(email: _emailController.text.toLowerCase());
        },
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Restablecer Contraseña"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.2),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                _emailFormfield,
                _button,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
