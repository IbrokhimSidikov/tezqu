import 'dart:async';

class AuthEventBus {
  static final AuthEventBus _instance = AuthEventBus._internal();
  factory AuthEventBus() => _instance;
  AuthEventBus._internal();

  final _unauthorizedController = StreamController<void>.broadcast();

  Stream<void> get onUnauthorized => _unauthorizedController.stream;

  void emitUnauthorized() {
    _unauthorizedController.add(null);
  }

  void dispose() {
    _unauthorizedController.close();
  }
}
