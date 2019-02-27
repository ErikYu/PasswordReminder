import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:core';
import 'dart:convert';

abstract class MyFiles {
  static final String pwd = 'pwds.json';
  static final String locker = 'locker.json';
}

class FileHelper {
  FileHelper(this.name);
  final String name;
  Future<String> getFile() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String appDirPath = appDir.path;
    return appDirPath;
  }

  localFile(path) async {
    return File('$path/$name');
  }

  checkIfFileExist() async {
    try {
      final File file = await localFile(await getFile());
      String str = await file.readAsString();
      print(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  initFile({String seedContent}) async {
    var fileExist = await checkIfFileExist();
    if (!fileExist) {
      File file = await localFile(await getFile());
      await file.create();
      if (seedContent != null) {
        file.writeAsStringSync(seedContent);
      }
    }
  }

  readFileAsJson() async {
    final File file = await localFile(await getFile());
    String str = await file.readAsString();
    return jsonDecode(str);
  }

  readFileAsString() async {
    final File file = await localFile(await getFile());
    return await file.readAsString();
  }

  saveLstFile(lst) async {
    final File file = await localFile(await getFile());
    file.writeAsStringSync(jsonEncode(lst));
  }

  saveStringFile(String val) async {
    final File file = await localFile(await getFile());
    file.writeAsStringSync(val);
  }

  resetFile() async {
    File file = await localFile(await getFile());
    file.writeAsStringSync('[]');
  }
}