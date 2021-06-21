

import 'package:flutter/material.dart';
import 'package:netgrow/Routes/Router.dart';

Future<void> showInfoDialog(String message , {required String title }) async {
  return showDialog<void>(
    context: NetGrowRouter.instance.navigatorKey.currentContext!,
    builder: (BuildContext context) {
      return AlertDialog(
        //TODO HACER UN A ALERTA MAS BONITA
        title: Text(title,textAlign: TextAlign.center,),
        content: Text(message),
      );
    },
  );
}