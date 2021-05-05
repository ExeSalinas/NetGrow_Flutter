import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  AnalyticsService._singleton();
  static final AnalyticsService _service = AnalyticsService._singleton();
  factory AnalyticsService() => _service;
  
  static FirebaseAnalytics get instance => _service._analytics;
  static FirebaseAnalyticsObserver get observer => FirebaseAnalyticsObserver(analytics: (_service._analytics));
  
}


