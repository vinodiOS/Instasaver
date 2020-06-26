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

    List imageFiles = new List();
    var directory = await ExtStorage.getExternalStorageDirectory();
    var allFiles = io.Directory("$directory/InstaSaver").listSync();
    for (final file in allFiles) {
      List<String> fileParts = file.path.split('.').toList();
      if (fileParts.length > 1) {
        if (fileParts[1] == "mp4") {
          controllers.add(new VideoPlayerController.file(
            file
        ));
        } else if (fileParts[1] == "png") {
          imageFiles.add(file);
        } else {
          print("nothing match");
        }
      }
    }
    setState(() {
      files = imageFiles;
    });
  }

  ListView _videoPlayer() {
     return new ListView(
          // Here's the magic. We convert our List<VideoPlayerController>
          // into a List<Widget>.
          children: controllers.map((controller) {
            return new Container(
              margin: new EdgeInsets.symmetric(vertical: 20.0),
              // To display a single Video Player, you need to create a `Chewie` Widget.
              // Since we want to show multiple videos, each item in the List will
              // contain a Chewie player
              child: Chewie(
                controller: new ChewieController(
                videoPlayerController: controller,
                aspectRatio: 3 / 2,
                autoInitialize: true,
                autoPlay: false,
                looping: true,
              ),
              ),
            );
          }).toList(),
        );
        
  }

  GridView _imageList() {
    return GridView.builder(
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
    return new DefaultTabController(length: 2, 
    child:  Scaffold(
      
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
        _imageList(),
        _videoPlayer()
      ]
      ),

    )
    );

  }
}