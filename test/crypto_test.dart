import 'package:flutter_test/flutter_test.dart';
import 'package:password_reminder/helpers/file_helper.dart';
import 'package:password_reminder/pages/index_lock/index_lock_service.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

void main() {
  test('crypto helper', () {
    expect(sha256.convert(utf8.encode('1234')).toString(), '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4');
  });
}

