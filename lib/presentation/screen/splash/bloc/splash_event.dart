class SplashEvent {
  final SplashEventType type;
  final String? extra;

  SplashEvent({
    required this.type,
    this.extra,
  });
}

enum SplashEventType { login, signup, skip }
