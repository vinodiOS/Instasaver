
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class Utils {
  
  /// Gets copied data from clipboard
  Future<String> getClipBoardData() async {
    ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
    return data.text != null ? data.text : "";
  }

  /// Shows temporary alerts
  static showIOSShortTimeAlert(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 5), () {
          Navigator.of(context).pop(true);});
          return AlertDialog(
            title: Text(title),
          );
      });
  }

  /// This function decides platform and shows alert accordingly. 
  static showOSWiseAlert(BuildContext context, String title) {
    if (Platform.isAndroid) {
      showDialogForAndroid(context, title);
    } else if (Platform.isIOS) {
      showAlertController(context, title);
    }
  }

  static showAlertController(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("InstaSaver"),
        content: new Text(title),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true, 
            child: new Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  static showDialogForAndroid(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("InstaSaver"),
          content: Text(title),
          actions: [
            FlatButton(
                child: Text("OK"),
                onPressed: () { 
                  Navigator.pop(context);
                },
              )],
          );
        });
    }
}