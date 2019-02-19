import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:core';
import 'dart:convert';

class FileHelper {
  static final String _name = 'pwds.json';
  Future<String> getFile() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String appDirPath = appDir.path;
    return appDirPath;
  }

  localFile(path) async {
    return File('$path/$_name');
  }

  checkIfFileExist() async {
    try {
      final File file = await localFile(await getFile());
      String str = await file.readAsString();
      return true;
    } catch (e) {
      return false;
    }
  }

  initFile() async {
    var fileExist = await checkIfFileExist();
    if (!fileExist) {
      File file = await localFile(await getFile());
      await file.create();
      file.writeAsStringSync('[]');
    }
  }

  readFile() async {
    final File file = await localFile(await getFile());
    String str = await file.readAsString();
    return jsonDecode(str);
  }

  saveFile(lst) async {
    final File file = await localFile(await getFile());
    file.writeAsStringSync(jsonEncode(lst));
  }

  resetFile() async {
    File file = await localFile(await getFile());
    file.writeAsStringSync('[]');
  }
}