import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard(
      {Key? key,
      required this.title,
      required this.child,
      this.height = 180.0,
      this.widthScreenFactor = 2,
      this.widthLandscapeScreenFactor = 3})
      : super(key: key);

  final String title;
  final Widget child;
  final double height;

  //Cuantoas cards van en la fila en modo portait utiliza el widget
  final int widthScreenFactor;
  final int widthLandscapeScreenFactor;
  // final double _cardSidesPadding = 0;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double deviceWidth = constraints.maxWidth;
      double deviceHeight = constraints.maxHeight;


      // UNUSED _ ESTABA PROBANDO PERO CREO QUE SE PUEDE MEJORAR, PERO NECESITO SABER CUANTAS CARDS HAY Y VER SI ME DA EL TAMAÑO PARA DIVIDIR HASTA LLEGAR A LAS N CARDS
      // ej CADA CARD ES DE 200 PX , SI TENGO 800 PX DE PANTALLA Y 4 CARDS , ENTONCES LA DIVIDO EN 4
      // SI TENGO 3 CARDS DIVIDO 800 EN 3 , Y SI TENGO 5 , COMO YA ME QUEDAN MUY PEQUEÑOS ( MENOS DEL MINIMO DE 200 )
      // ENTONCES LA DIVIDO EN 3 Y DEJO QUE EL WRAP HAGA LO SUYO


      // var _widthScreenFactor = widthScreenFactor;
      // var _widthLandscapeScreenFactor = widthLandscapeScreenFactor;
      //
      //
      // if (constraints.maxWidth > 800 &&
      //     widthLandscapeScreenFactor != 1 &&
      //     widthScreenFactor != 1) {
      //   _widthLandscapeScreenFactor++;
      //   _widthScreenFactor++;
      // }if (constraints.maxWidth < 800 &&
      //     widthLandscapeScreenFactor != 1 &&
      //     widthScreenFactor != 1) {
      //   _widthLandscapeScreenFactor++;
      //   _widthScreenFactor++;
      // }
      return Container(
        width: (MediaQuery.of(context).orientation == Orientation.portrait)
            ? (deviceWidth / widthScreenFactor)
            : (deviceWidth / widthLandscapeScreenFactor),
        height: height,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                fit: FlexFit.loose,
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    "Sensor $title",
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: child,
              ),
            ],
          ),
        ),
      );
    } );
  }
}
