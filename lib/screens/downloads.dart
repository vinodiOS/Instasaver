import 'dart:html';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'package:ext_storage/ext_storage.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class Downloads extends StatefulWidget {

  @override
  DownloadsState createState() => new DownloadsState();
}

class DownloadsState extends State<Downloads> {
  String directory;
  List files = new List();

  @override
  void initState() {
    super.initState();
    _listofFiles();
  }
  
  //Fetch files from app directory
  void _listofFiles() async {
    var directory = await ExtStorage.getExternalStorageDirectory();
    print(directory);
    setState(() {
      files = io.Directory("$directory/InstaSaver").listSync();
      print(files);
    });
  }

  void checkFileIsOfImageOrVideoType(File file) {
    List<String> fileParts = file.toString().split('?').toList();
    print(fileParts);
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Downloads")
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, index) {
          return new Card(
            elevation: 3,
            child: Image.file(files[index]),
          );
        },
        itemCount: files.length,
      ),
    );
  }
}