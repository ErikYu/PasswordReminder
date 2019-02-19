import 'package:flutter_test/flutter_test.dart';
import 'package:password_reminder/models/password.dart';
import 'package:password_reminder/helpers/file_helper.dart';

void main() {
  test('file helper', () {
    FileHelper().checkIfFileExist();
  });
}

