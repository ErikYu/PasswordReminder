// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:password_reminder/main.dart';
import 'package:password_reminder/models/password.dart';

void main() {
  test('password encrypted test', () {
    var res1 = PasswordItem(salt: 'juhn').encrypt('Password123');
    expect(res1, 'anVoblBhc3N3b3JkMTIz');
  });

  test('password decrypted test', () {
    var res = PasswordItem(salt: 'juhn', encrypted: 'anVoblBhc3N3b3JkMTIz').decrypt();
    expect(res, 'Password123');
  });

  test('create salt test', () {
    var res = PasswordItem.createSalt();
    expect(res.isNotEmpty, true);
    expect(res.length, 4);
  });
}

