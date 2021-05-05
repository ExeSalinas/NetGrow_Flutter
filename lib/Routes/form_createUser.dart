import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:netgrow/Firebase/auth.dart';

class CreateUserForm extends StatefulWidget {
  @override
  _CreateUserFormState createState() => _CreateUserFormState();
}

class _CreateUserFormState extends State<CreateUserForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordCheckController = TextEditingController();
  bool _passwdVisible = true;
  bool _passwdCheckVisible = true;
  final _paddingFormFields = EdgeInsets.all(8.0);

  @override
  void initState() {
    _passwdVisible = true;
    _passwdCheckVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _context = Theme.of(context);

    final _emailFormfield = TextFormField(
      controller: _emailController,
      key: Key("CreateUseremailFormfield"),
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
      key: Key("CreateUserPasswdFormfield"),
      style: _context.textTheme.headline6,
      obscureText: _passwdVisible,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value.isEmpty)
          return 'Por favor ingrese una Contraseña';
      },
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
    final _passwdCheckFormfield = TextFormField(
      controller: _passwordCheckController,
      key: Key("CreateUserpasswdCheckFormfield"),
      style: _context.textTheme.headline6,
      obscureText: _passwdCheckVisible,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value.isEmpty)
          return 'Por favor ingrese una Contraseña';
        if (value != _passwordController.text)
          return 'Las contraseñas no coinciden';
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Repita su Contraseña',
        labelText: 'Repita su Contraseña',
        suffixIcon: IconButton(
          icon: Icon(
              _passwdCheckVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _passwdCheckVisible = !_passwdCheckVisible;
            });
          },
        ),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        child: Text(
          "Crear usuario",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async {
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('DONE'),
            ),
          );
        },
      ),
    );

    final form = Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch
        ,
        children: [
          Padding(
            padding: _paddingFormFields,
            child: _emailFormfield,
          ),
          Padding(
            padding: _paddingFormFields,
            child: _passwdFormfield,
          ),
          Padding(
            padding: _paddingFormFields,
            child: _passwdCheckFormfield,
          ),
          loginButton
        ],
      ),
    );

    return form;
  }
}
