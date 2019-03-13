import 'package:rxdart/rxdart.dart';

class NavigationStore {
  var locked;

  NavigationStore.internal() {
    print('实例化 NavigationStore');
    locked = new BehaviorSubject<bool>.seeded(false);
  }
  static final NavigationStore _instance = NavigationStore.internal();
  factory NavigationStore() => _instance;
}
