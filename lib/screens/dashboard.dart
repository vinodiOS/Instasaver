
import 'package:flutter/cupertino.dart';
import 'dart:io' show File, Platform;
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:insave/models/Post.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';

class Dashboard extends StatefulWidget {

  @override 
  DashboardState createState() => new DashboardState();
}

class DashboardState extends State<Dashboard>  {
  Dio dio = new Dio();
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffF58529), Color(0xffDD2A7B), Color(0xff8134AF), Color(0xff515BD4)])
    .createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0)
  );

  Future<Post> fetchPost(String urlString) async {
    final response = await dio.get(urlString);
    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.toString()));
    } else {
      throw Exception('Failed to load post');
    }
  }
  
  _saveImage(String imageURL) async {
    var response = await Dio().get(imageURL, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
  }
  
  _downloadFile(String url) async {
    final timeStamp = new DateTime.now().millisecondsSinceEpoch;
    var appDocDir = await getTemporaryDirectory();
    String savePath = appDocDir.path + "$timeStamp.mp4";
    await Dio().download(url, savePath);
    final result = await ImageGallerySaver.saveFile(savePath);
    print(result);
  }

void _identifyImageOrVideo(String url) async {

  List<String> urlParts = url.split('?').toList();
  if (urlParts.length != 0) {
    String finalURL = urlParts.first + "?__a=1";
    try {
      Post post = await fetchPost(finalURL);
      String videoURL = post.graphql.shortcodeMedia.videoUrl;
      if ((videoURL?.isEmpty ?? true) || videoURL == null) {
        print("This is image");
        _saveImage(post.graphql.shortcodeMedia.displayUrl);
      } else {
        _downloadFile(videoURL);
      }
    } catch (error) {
      print(error);
    }
  } else {
    print("Invalid Url");
  }  
}

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'InstaSaver',
              style: new TextStyle(
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient),
            ),
            
            Center(
              child: Container(
                height: 60.0,
                child: RaisedButton(
                  onPressed: () async {
                    String urlString = await Utils().getClipBoardData();
                    if (urlString.isEmpty || urlString == null) {
                      Utils.showAlert(context, "URL not found.");
                    } else {
                      RegExp re = RegExp(r'^https://(www.)?instagram.com/.*/');
                      if (re.hasMatch(urlString)) {
                        _identifyImageOrVideo(urlString);
                      } else {
                        Utils.showAlert(context, "Invalid URL.");
                      }
                    }
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                   padding: EdgeInsets.all(0.0),
                   child: Ink(
                     decoration: BoxDecoration(
                       gradient: LinearGradient(colors: [Color(0xffF58529), Color(0xffDD2A7B), Color(0xff8134AF), Color(0xff515BD4)],
                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                       ),
                       borderRadius: BorderRadius.circular(30.0)
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width/1.5,
                        height: 60.0,
                        alignment: Alignment.center,
                        child: Text(
                          "Paste link here",
                          textAlign: TextAlign.center,style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                  ),
                ),
              ),
            )
          ]
        )
      ),
    );
  }
}

class PermissionService {
  var permission = Platform.isAndroid ? Permission.storage : Permission.photos;

  Future<bool> requestStoragePermission({Function onPermissionDenied}) async {
    var granted = await _requestPermission(permission);
    if (!granted) {
      onPermissionDenied();
    }
    return granted;
  }

   Future<bool> _requestPermission(Permission permission) async {
    var result = await permission.request();
    if (result == PermissionStatus.granted) {
      return true;
    }
    return false;
  }
}

class Utils {
  
  Future<String> getClipBoardData() async {
    ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
    return data.text != null ? data.text : "";
  }

  static showAlert(BuildContext context, String title) {
    
    if (Platform.isAndroid) {
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
    } else if (Platform.isIOS) {
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
  }
}