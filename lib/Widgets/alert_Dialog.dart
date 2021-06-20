import 'package:flutter/material.dart';
import 'package:netgrow/Routes/Router.dart';

Future<void> showAlertDialog(String message) async {
  return showDialog<void>(
    context: NetGrowRouter.instance.navigatorKey.currentContext!,
    builder: (BuildContext context) {
      return AlertDialog(
        //TODO HACER UN A ALERTA MAS BONITA
        title: Text('Error!'),
        content: Text(message),
      );
    },
  );
}