import 'package:rxdart/rxdart.dart';

class NavigationStore {
  NavigationStore.internal() {
    print('实例化 NavigationStore');
  }
  static final NavigationStore _instance = NavigationStore.internal();
  factory NavigationStore() => _instance;

  BehaviorSubject<bool> locked = BehaviorSubject<bool>(seedValue: false);
}
