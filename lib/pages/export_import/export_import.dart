import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './export_import_service.dart';

// TODO: import shall be divided into two parts
// - replace all
// - add all

// TODO: import should support data and file at the same time

class ExportImport extends StatefulWidget {
  @override
  _ExportImportState createState() => _ExportImportState();
}

class _ExportImportState extends State<ExportImport> {
  int currentPanelIndex = -1;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Export / Import'),
      ),
      body: Builder(builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int i, bool expanded) {
                setState(() {
                  currentPanelIndex=(currentPanelIndex != i ? i : -1);
                });
              },
              children: [
                ExpansionPanel(
                  isExpanded: currentPanelIndex == 0,
                  body: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('Click <Export> - <Copy> button, you will get all your passwords on your clipboard;'),
                        RaisedButton.icon(
                          icon: Icon(Icons.file_download, color: Colors.white),
                          color: Theme.of(context).primaryColor,
                          label: Text('Export', style: TextStyle(color: Colors.white)),
                          onPressed: () async {
                            // 弹窗 显示字符
                            String res = await ExportImportService.getPasswordsFile();
                            _askToCopy(context, res);
                          },
                        )
                      ],
                    ),
                  ),
                  headerBuilder: (BuildContext context, bool expanded) {
                    return ListTile(title: Text('Export'));
                  }
                ),
                ExpansionPanel(
                    isExpanded: currentPanelIndex == 1,
                    body: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text('Click <Import>, Text in you passwords content, Click <Save>'),
                          Text('This action will delete all your passwords and replace then with the new passwords.', style: TextStyle(fontWeight: FontWeight.bold)),
                          RaisedButton.icon(
                            icon: Icon(Icons.file_upload, color: Colors.white),
                            color: Theme.of(context).primaryColor,
                            label: Text('Import', style: TextStyle(color: Colors.white)),
                            onPressed: () async {
                              // 弹窗 显示字符
                              _askToPaste(context);
                            },
                          )
                        ],
                      ),
                    ),
                    headerBuilder: (BuildContext context, bool expanded) {
                      return ListTile(title: Text('Import'));
                    }
                )
              ],
            )
          ],
        );
      }),
    );
  }

  // create a dialog to download the password list file content
  Future _askToCopy(c, String val) async {
    return showDialog(
      context: c,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Content'),
          content: Text('$val'),
          actions: <Widget>[
            FlatButton(
              child: Text('Copy'),
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: val));
                Navigator.pop(context);
                Scaffold.of(c).showSnackBar(SnackBar(content: Text('Copied successfully')));
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

  Future _askToPaste(BuildContext c) async {
    String val = '[]';
    return showDialog(
      context: c,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Paste and save'),
          content: TextField(
            maxLines: 10,
            onChanged: (String str) {
              val = str;
            },
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Save'),
              onPressed: () async {
                await ExportImportService.deleteAndInsertAllPasswords(val);
                Navigator.pop(context);
                Scaffold.of(c).showSnackBar(SnackBar(content: Text('Saved successfully')));
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      }
    );
  }

}
