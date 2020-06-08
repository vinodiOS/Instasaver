
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insave/Utility/Utils.dart';
import 'package:insave/models/Post.dart';
import 'package:insave/Networking/Networking.dart';
import 'package:insave/Utility/PermissionServices.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io' show Platform;

class Dashboard extends StatefulWidget {

  @override 
  DashboardState createState() => new DashboardState();
}

class DashboardState extends State<Dashboard>  {
  
  String buttonTitle = "";
  
  @override
  void initState() {
    buttonTitle = "Paste URL here";
    super.initState();
  }
 
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffF58529), Color(0xffDD2A7B), Color(0xff8134AF), Color(0xff515BD4)])
    .createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0)
  );
  
  void _identifyImageOrVideo(String url) async {
    
    List<String> urlParts = url.split('?').toList();
    if (urlParts.length != 0) {
      String finalURL = urlParts.first + "?__a=1";
      try {
        Post post = await Networking().fetchPost(finalURL);
        String videoURL = post.graphql.shortcodeMedia.videoUrl;
        
        //Check permission
        final permission = await PermissionService().requestStoragePermission();
        if(permission) {
          if ((videoURL?.isEmpty ?? true) || videoURL == null) {
            changeButtonTitle("Downloading...");
            final result = await Networking().saveImage(post.graphql.shortcodeMedia.displayUrl);
            changeButtonTitle("Paste URL here");
            _showShortTermAlert(context, result.isEmpty ? "Failed to save image." : "Image saved successfully.");
          } else {
            changeButtonTitle("Downloading...");
            final result = await Networking().downloadFile(videoURL);
            changeButtonTitle("Paste URL here");
            _showShortTermAlert(context, result.isEmpty ? "Failed to save image." : "Video saved successfully.");
          }
        } else {
          Utils.showOSWiseAlert(context, "Permission denied. Please allow access from Settings.");
        }

      } catch (error) {
        Utils.showOSWiseAlert(context, error.toString());
      }
    } else {
      Utils.showOSWiseAlert(context, "Invalid URL");
    }  
  }
  
  void changeButtonTitle(String title) {
    setState(() {
      buttonTitle = title;
    });
  }

  void _showShortTermAlert(BuildContext  context, String title) {
    if (Platform.isAndroid) {
      showToast(context, title);
    } else if (Platform.isIOS) {
      Utils.showIOSShortTimeAlert(context, title);
    }
  }

  void _pasteLinkButtonDidTap() async {
    if (buttonTitle == "Downloading...") {
      return;
    }
    String urlString = await Utils().getClipBoardData();
    if (urlString.isEmpty || urlString == null) {
      Utils.showOSWiseAlert(context, "URL not found.");
    } else {
      RegExp re = RegExp(r'^https://(www.)?instagram.com/.*/');
      if (re.hasMatch(urlString)) {
        _identifyImageOrVideo(urlString);
      } else {
        Utils.showOSWiseAlert(context, "Invalid URL.");
      }
    }
  }

  static showToast(BuildContext context, String title) {
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
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
                  onPressed: () {
                    _pasteLinkButtonDidTap();
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
                          buttonTitle,
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



