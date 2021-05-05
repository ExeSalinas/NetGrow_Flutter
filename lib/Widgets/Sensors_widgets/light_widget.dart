import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// MUY DIFEREnte EL WIDET DE TEMP , REVISAR SI  NO ES RESPONSIVE , SI FUNCIONA WP , SI NO REFACTOR EN FUNCION DE TEMPERATURA

class LightWidget extends StatefulWidget {
  final bool estado;
  final nombre;
  final height;
  //Cuanto de el ancho de la pantalla en modo portait utiliza el widget
  final int widthScreenFactor;
  final int widthLandscapeScreenFactor;
  LightWidget(
      {Key? key,
      required this.estado,
      required this.nombre,
      this.height = 150.0,
      this.widthScreenFactor = 2,
      this.widthLandscapeScreenFactor = 3})
      : assert(nombre != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LightWidgetState();
  }
}

class _LightWidgetState extends State<LightWidget> {
  var estado;
  @override
  void initState() {
    estado = widget.estado;
    super.initState();
  }

  void _cardTap() {
    setState(() {
      estado = !estado;
    });
  }

  @override
  Widget build(BuildContext context) {
    const _paddingContent =
        EdgeInsets.symmetric(vertical: 5.0, horizontal: 6.0);
    const _cardSidesPadding = 12.0;
    const _cardPadding = EdgeInsets.fromLTRB(
        _cardSidesPadding, _cardSidesPadding, _cardSidesPadding, 6);
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    var card = InkWell(
      onTap: _cardTap,
      child: Card(
        child: Padding(
          padding: _cardPadding,
          child: Column(
            children: [
              Flexible(
                  fit: FlexFit.loose,
                  flex: 2,
                  child: Text(
                    "Sensor de luz ${widget.nombre}",
                    style: Theme.of(context).textTheme.headline6,
                  )),
              Flexible(
                flex: 3,
                fit: FlexFit.loose,
                child: Image.asset(
                  estado
                      ? r'assets\Imagenes\Sensores\Luz\bombilla_encendida.png'
                      : r'assets\Imagenes\Sensores\Luz\bombilla.png',
                ),
              )
            ],
          ),
        ),
      ),
    );
    // return ConstrainedBox(
    //     constraints: BoxConstraints( minWidth: 170.0 ,maxWidth: (MediaQuery.of(context).orientation == Orientation.portrait)
    //         ? ((deviceWidth / widget.widthScreenFactor) -
    //         (_cardSidesPadding * 2))
    //         : ((deviceWidth / widget.widthLandscapeScreenFactor) -
    //         (_cardSidesPadding * 2)),
    //       maxHeight: widget.height,),
    //     child: card);

    return Container(
      width: (MediaQuery.of(context).orientation == Orientation.portrait)
          ? ((deviceWidth / widget.widthScreenFactor) - (_cardSidesPadding * 2))
          : ((deviceWidth / widget.widthLandscapeScreenFactor) -
              (_cardSidesPadding * 2)),
      height: 150,
      child: card,
    );
  }
}
