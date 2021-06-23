import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netgrow/Widgets/Sensors_widgets/card.dart';

class HumidityWidget extends StatefulWidget {
  final String nombre;
  final humedad;
  final double height;
  final int widthScreenFactor;
  final int widthLandscapeScreenFactor;
  HumidityWidget({
    Key? key,
    required this.nombre,
    required this.humedad,
    this.height = 150.0,
    this.widthScreenFactor = 1,
    this.widthLandscapeScreenFactor = 1,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HumiditWidgetState();
  }
}

class _HumiditWidgetState extends State<HumidityWidget> {
  late double hum;

  void initState() {
    hum = widget.humedad;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const _padding = EdgeInsets.symmetric(vertical: 5.0, horizontal: 6.0);
    const _cardSidesPadding = 12.0;
    const _cardPadding = EdgeInsets.fromLTRB(
        _cardSidesPadding, _cardSidesPadding, _cardSidesPadding, 6);

    var card = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: _padding,
          child: Text(
            "$hum %",
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          flex: 1,
          child: Padding(
            padding: _padding,
            child: Image.asset(
              r'assets\Imagenes\Sensores\Humedad\humidity.png',
            ),
          ),
        ),
      ],
    );
    return DashboardCard(
      title: "humedad " + widget.nombre,
      child: card,
      widthScreenFactor: 1,
      widthLandscapeScreenFactor: 1,
    );
  }
}
