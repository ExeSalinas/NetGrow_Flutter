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
  final double _cardSidesPadding = 12;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      // Chorizo de sumas que permiten en horizontal y vertical , y con varias cards u
      //una unica card que ocupe t0d0 el espacio
      width: (MediaQuery.of(context).orientation == Orientation.portrait)
          ? (widthScreenFactor == 1)
              ? ((deviceWidth / widthScreenFactor) -
                  (widthScreenFactor * _cardSidesPadding * 4))
              : ((deviceWidth / widthScreenFactor) -
                  (widthScreenFactor * _cardSidesPadding))
          : (widthLandscapeScreenFactor == 1)
              ? ((deviceWidth / widthLandscapeScreenFactor) -
                  (widthLandscapeScreenFactor * _cardSidesPadding * 4))
              : ((deviceWidth / widthLandscapeScreenFactor) -
                  (widthLandscapeScreenFactor * _cardSidesPadding)),
      height: height,
      child: Card(
        child: Padding(
          padding:
              EdgeInsets.fromLTRB(_cardSidesPadding, 12, _cardSidesPadding, 6),
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
                    style: Theme.of(context).textTheme.headline6 , textAlign: TextAlign.center,
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
      ),
    );
  }
}
