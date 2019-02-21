import 'package:password_reminder/helpers/file_helper.dart';

class ExportImportService {
  static Future<String> getPasswordsFile() async {
    return await FileHelper(MyFiles.pwd).readFileAsString();
  }
}