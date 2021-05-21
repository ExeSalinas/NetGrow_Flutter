import 'package:flutter/material.dart';
import 'package:netgrow/Routes/login_route.dart';

/// Maneja lo relacionado con la navegacion , permite separar en capas la navegaion de la ui;
///
/// Para agregar una nuev aruta primero hay que agregarla al [router.dart].
/// y luego agregar la ruta a el switch
/// Implementa patron Singleton.

class NetGrowRouter {
  // Singleton Builder
  factory NetGrowRouter() => _router;
  NetGrowRouter.singleton();
  static final NetGrowRouter _router = NetGrowRouter.singleton();
  static NetGrowRouter get instance => _router;
  // Singleton end

  /// Key so we can navigate without context.
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Setup initial route name
  String initialRoute = Login.id;

  /// Wdiget to be loaded first
  Widget home = Login();

  Future<T?> push<T extends Object>(Route<T> route) async {
    return navigatorKey.currentState!.push(route);
  }

  Future<T?> pushReplacement<T extends Object>(Route<T> route) async {
    return navigatorKey.currentState!.pushReplacement(route);
  }

  Future<T?> pushAndRemoveUntil<T extends Object>(
    Route<T> route, {
    String? untilRoute,
  }) async {
    return navigatorKey.currentState!.pushAndRemoveUntil(
      route,
      (Route<dynamic> _route) {
        return untilRoute == _route.settings.name;
      },
    );
  }

  void pop() {
    navigatorKey.currentState!.pop();
  }

  void popUntil(String route) {
    return navigatorKey.currentState!.popUntil(ModalRoute.withName(route));
  }

  /// Page route builder with forced fade in / out transition.
  static PageRouteBuilder<Widget> fadeTransition(
    RouteSettings settings, {
    required Widget screen,
  }) {
    return PageRouteBuilder<Widget>(
      settings: settings,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return screen;
      },
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  /// Page route builder with forced slide in from top
  static PageRouteBuilder<Widget> fromTopTransition(
    RouteSettings settings, {
    required Widget screen,
  }) {
    return PageRouteBuilder<Widget>(
      settings: settings,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return screen;
      },
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }
}
