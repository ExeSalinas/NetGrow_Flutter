import 'package:flutter/material.dart';
import 'package:netgrow/Services/analytics.dart';

class FormAddArduino extends StatefulWidget {
  const FormAddArduino({Key? key}) : super(key: key);

  @override
  _FormAddArduinoState createState() => _FormAddArduinoState();
}

class _FormAddArduinoState extends State<FormAddArduino> {

  //TODO  aprender sobre las keys
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  final _paddingTextForms = EdgeInsets.all(8.0);
  final AnalyticsService _analyticsService = AnalyticsService();
  @override
  Widget build(BuildContext context) {
   return AlertDialog(
      content: Form(
        // TODO Revisar las propiedades del FORM
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Text form nombre del dispositivo
            Padding(
              padding: _paddingTextForms,
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nombre para este dispositivo',
                    labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un nombre';
                  }
                  return null;
                },
              ),
            ),
            // Text form codigo de conexion del dispositivo
            Padding(
              padding: _paddingTextForms,
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Código de conexion',
                    labelText: 'Código'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un codigo de conexion';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: _paddingTextForms,
              child: ElevatedButton(style: Theme.of(context).elevatedButtonTheme.style,
                child: Text(
                  "Agregar",
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: () {

                _analyticsService.logArduinoRegistered();
                  // TODO AGREGAR ALA LISTAS DE ARDUINOS
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Agregado un nuevo dispositivo a mi lista'),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
