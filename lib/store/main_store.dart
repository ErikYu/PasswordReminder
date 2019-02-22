import 'dart:async';
import 'package:rxdart/rxdart.dart';

class MainStore {
  MainStore.internal() {
    print('实例化 MainStore');
  }
  static final MainStore _instance = MainStore.internal();
  factory MainStore() => _instance;
}
