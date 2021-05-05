import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HumidityWidget extends StatefulWidget {
  final String nombre;
  final humedad;
  final double height;
  final int widthScreenFactor;
  final int widthLandscapeScreenFactor;
  //Variable de mierda que solo
  final double fatherpadding;
  HumidityWidget(
      {Key? key,
      required this.nombre,
      required this.humedad,
      this.height = 150.0,
      this.widthScreenFactor = 1,
      this.widthLandscapeScreenFactor = 1,
      this.fatherpadding = 16.0})
      : super(key: key);

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

    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    var card = Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "Sensor de humedad ${widget.nombre}",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Row(
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
                      flex: 4,
                      child: Padding(
                        padding: _padding,
                        child: Image.asset(
                          r'assets\Imagenes\Sensores\Humedad\humidity.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    return Container(
      width: (MediaQuery.of(context).orientation == Orientation.portrait)
          ? (widget.widthScreenFactor == 1)
              ? null
              : ((deviceWidth / widget.widthScreenFactor) -
                  (_cardSidesPadding * 2) -
                  widget.fatherpadding)
          : (widget.widthLandscapeScreenFactor == 1)
              ? null
              : ((deviceWidth / widget.widthLandscapeScreenFactor) -
                  (_cardSidesPadding * 2) -
                  widget.fatherpadding * 2),
      height: 150,
      child: card,
    );
  }
}
