import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netgrow/Widgets/arduino_tile.dart';
import 'package:netgrow/Widgets/form_addArduino.dart';

import '../Entities/arduino.dart';

// Constantes
List<Arduino> arduinos = [
  Arduino(conexion: "123456", nombre: "sativa 1 ", sensores: []),
  Arduino(conexion: "789123", nombre: "sativa 2", sensores: [])
];

class MisArduino extends StatefulWidget {
  static final id = "Dashboard";
  static Route<MisArduino> route() {
    return MaterialPageRoute<MisArduino>(
      settings: RouteSettings(name: id),
      builder: (BuildContext context) => MisArduino(),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return _MisArduinoState();
  }
}

class _MisArduinoState extends State {


  void _addButonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FormAddArduino();
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
