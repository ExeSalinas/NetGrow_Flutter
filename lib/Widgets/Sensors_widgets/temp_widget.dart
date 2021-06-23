import 'package:flutter/material.dart';
import 'package:netgrow/Widgets/Sensors_widgets/card.dart';

class TemperatureWidget extends StatefulWidget {
  final nombre;
  final double temperature;
  final double height;
  final int widthScreenFactor;
  final int widthLandscapeScreenFactor;
  TemperatureWidget(
      {Key? key,
      required this.nombre,
      required this.temperature,
      this.height = 150.0,
      this.widthScreenFactor = 2,
      this.widthLandscapeScreenFactor = 3})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TemperatureWidgetState();
  }
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  late double temp;
  void initState() {
    temp = widget.temperature;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const _paddingContent =
        EdgeInsets.symmetric(vertical: 5.0, horizontal: 6.0);
    const _cardSidesPadding = 12.0;
    const _cardPadding = EdgeInsets.fromLTRB(
        _cardSidesPadding, _cardSidesPadding, _cardSidesPadding, 6);


    var card = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: _paddingContent,
          child: Text(
            "$temp",
            overflow: TextOverflow.visible,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          flex: 1,
          child: Padding(
            padding: _paddingContent,
            child: Image.asset(
              (temp > 35.00)
                  ? r'assets\Imagenes\Sensores\Temperatura\Termometro_Calor.png'
                  : (temp < 5.00)
                      ? r'assets\Imagenes\Sensores\Temperatura\Termometro_Frio.png'
                      : r'assets\Imagenes\Sensores\Temperatura\Termometro.png',
            ),
          ),
        ),
      ],
    );
    return DashboardCard(title: "Temp ${widget.nombre}", child:  card , height: 180,);
  }
}
