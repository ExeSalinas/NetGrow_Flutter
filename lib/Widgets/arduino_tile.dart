import 'package:flutter/material.dart';
import 'package:netgrow/Entities/arduino.dart';
import 'package:netgrow/Routes/dashboard_route.dart';

//Constantes
const _altura = 100.00;
const _color = Colors.lightBlueAccent;

class ArduinoTile extends StatelessWidget {
  final Arduino arduino;

  const ArduinoTile({Key? key, required this.arduino})
      : super(key: key);

  //Navigate to the [DashboardRoute]
  void _navigateToDashboard(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return DashboardRoute(title: arduino.nombre);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    return Material(
      child: Container(
        height: _altura,
        child: InkWell(
          highlightColor: _color,
          splashColor: _color[100],
          onTap: () {
            _navigateToDashboard(context);
          },
          child: Center(
            child: Column(
              children: [
                Text(
                  "${arduino.nombre}",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text("${arduino.conexion}", // CADENA de Conexion Completa

                  //"${arduino.conexion.substring(arduino.conexion.length - 3 )}",
                  // Ultimos 3 digitlos de la cad de conexion

                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
