import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netgrow/Widgets/Sensors_widgets/card.dart';

class SoilWidget extends StatefulWidget {
  final nombre;
  final double humidity;
  final double height;
  final int widthScreenFactor;
  final int widthLandscapeScreenFactor;
  SoilWidget(
      {Key? key,
      required this.nombre,
      required this.humidity,
      this.height = 150.0,
      this.widthScreenFactor = 2,
      this.widthLandscapeScreenFactor = 3})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SoilWidgetState();
  }
}

class _SoilWidgetState extends State<SoilWidget> {
  late double hum;

  @override
  void initState() {
    hum = widget.humidity;
    super.initState();
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

    var card = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: _paddingContent,
          child: Text(
            "$hum",
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
                r'assets\Imagenes\Sensores\HumSuelo\soil.png'),
          ),
        ),
      ],
    );
    return DashboardCard(title: "Humedad Suelo ${widget.nombre}" ,  child: card);
  }
}
