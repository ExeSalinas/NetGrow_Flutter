import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

/// Service que implementa analytics de Firebase.
///

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  AnalyticsService._singleton();

  static final AnalyticsService _service = AnalyticsService._singleton();

  factory AnalyticsService() => _service;

  static AnalyticsService get instance => _service;

  static FirebaseAnalyticsObserver get observer =>
      FirebaseAnalyticsObserver(analytics: (_service._analytics));

  /// Metodo del service que permite logear un evento de login
  /// [method] es un string que especifica cual fue el metodo de logeo empleado
  Future<void> logLogin(String method) async {
    return _analytics.logLogin(loginMethod: method);
  }

  ///Permite Registrar el userID Y setea una user Property presonalizada
  ///[userRol] Indica el rol del usuario
  Future<void> setUserProperties(
      {required String userID, required String userRol}) async {
    await _analytics.setUserId(userID);
    await _analytics.setUserProperty(name: 'UserRol', value: userRol);
  }
  /// Logea el evento de Registro de un Arduino
  Future<void> logArduinoRegistered() async {
    _analytics.logEvent(name: "ArduinoRegistrado");
  }
}
