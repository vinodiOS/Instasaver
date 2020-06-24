import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'package:ext_storage/ext_storage.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class Downloads extends StatefulWidget {

  @override
  DownloadsState createState() => new DownloadsState();
}

class DownloadsState extends State<Downloads> {
  String directory;
  List files = new List();
  List<VideoPlayerController> controllers = new List<VideoPlayerController>();

  @override
  void initState() {
    super.initState();
    _listofFiles();
  }
  
  //Fetch files from app directory
  void _listofFiles() async {
    var directory = await ExtStorage.getExternalStorageDirectory();
    setState(() {
      var allFiles = io.Directory("$directory/InstaSaver").listSync();
      for
    });
  }

  Future<Card> _getCard(File file) async {
    List<String> fileParts = file.toString().split('.').toList();
    print(fileParts);
    if (fileParts[1] == "mp4") {
      final uint8list = await VideoThumbnail.thumbnailData(
        video: file.path,
        imageFormat: ImageFormat.JPEG,
        maxWidth: 128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
        quality: 25,
      );
      return new Card(
        elevation: 3,
        child: Image.memory(uint8list),
      );
    } else {
      return new Card(
        elevation: 3,
        child: Image.file(file),
      );
    }
  }

  _imageList() {
    GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, index) {
          return new Card(
        elevation: 3,
        child: Image.file(files[index],fit: BoxFit.fill,),
      );
        },
        itemCount: files.length,
      );
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Downloads"),
        bottom: TabBar(tabs:
        [
          Tab(icon: Icon(Icons.image)),
          Tab(icon: Icon(Icons.video_library),)
        ]
        ),
      ),
      body: TabBarView(children: 
      [
        _imageList()
      ]
      ),

    );
  }
}