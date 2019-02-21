import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './export_import_service.dart';

// TODO: import shall be divided into two parts
// - replace all
// - add all

// TODO: import should support data and file at the same time

class ExportImport extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Export / Import'),
      ),
      body: Builder(builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(
              icon: Icon(Icons.file_download, color: Colors.white),
              color: Theme.of(context).primaryColor,
              label: Text('Export', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                // 弹窗 显示字符
                String res = await ExportImportService.getPasswordsFile();
                _askToPaste(context, res);
              },
            ),
            RaisedButton.icon(
              icon: Icon(Icons.file_upload, color: Colors.white),
              color: Theme.of(context).primaryColor,
              label: Text('Import', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                // 弹窗 显示字符
                String res = await ExportImportService.getPasswordsFile();
                _askToPaste(context, res);
              },
            ),
          ],
        );
      }),
    );
  }

  // create a dialog to download the password list file content
  Future _askToPaste(c, String val) async {
    return showDialog(
      context: c,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Content'),
          content: Text('$val'),
          actions: <Widget>[
            FlatButton(
              child: Text('Paste'),
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: val));
                Navigator.pop(context);
                Scaffold.of(c).showSnackBar(SnackBar(content: Text('Paste successfully')));
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      }
    );
  }
}
