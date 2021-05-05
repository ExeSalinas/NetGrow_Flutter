import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netgrow/Widgets/arduino_tile.dart';

import '../Entities/arduino.dart';

// Constantes
List<Arduino> arduinos = [
  Arduino(conexion: "123456", nombre: "sativa 1 ", sensores: []),
  Arduino(conexion: "789123", nombre: "sativa 2", sensores: [])
];

class MisArduino extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MisArduinoState();
  }
}

class _MisArduinoState extends State {
  //TODO  aprender sobre las keys
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  final _paddingTextForms = EdgeInsets.all(8.0);

  void _addButonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                  child: ElevatedButton(
                    child: Text(
                      "Agregar",
                      style: Theme.of(context).textTheme.button,
                    ),
                    onPressed: () {
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text('Mis Arduino', style: Theme.of(context).textTheme.headline5),
      ),
      body: ListView(
        children: [
          ArduinoTile(
            arduino: arduinos[0],
          ),
          ArduinoTile(arduino: arduinos[1])
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Registrar un Nuevo dispositivo",
        onPressed: () => _addButonPressed(context),
      ),
    );
  }
}
