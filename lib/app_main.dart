import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:netgrow/Routes/Router.dart';
import 'package:netgrow/Services/analytics.dart';
import 'package:netgrow/Services/auth.dart';
import 'package:netgrow/theme.dart';

import 'Routes/login_route.dart';
import 'package:netgrow/Routes/misArduino_route.dart';


class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAnalyticsObserver observer = AnalyticsService.observer;
    final AuthService _authService = AuthService();

    Widget app = MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Net Grow',
        navigatorObservers: [observer],
        theme: getTheme(),
        navigatorKey: NetGrowRouter.instance.navigatorKey,
        // Compruebo si esta loggeado el usuario previamente
        home: (_authService.currentUser == null) ? Login() : MisArduino());

    return app;
  }
}
