
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:typed_data';
import 'package:network_image_to_byte/network_image_to_byte.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:insave/models/Post.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {

  @override 
  DashboardState createState() => new DashboardState();
}

class DashboardState extends State<Dashboard>  {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffF58529), Color(0xffDD2A7B), Color(0xff8134AF), Color(0xff515BD4)])
    .createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0)
  );

  Future<Post> fetchPost(String urlString) async {
  final response = await http.get(urlString);
  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

Future<Uint8List> _saveImage(String imageURL) async {
  Uint8List byteImage = await networkImageToByte(imageURL);
  final result = await ImageGallerySaver.saveImage(byteImage);
  print("Image save operation result: $result");
}

void _identifyImageOrVideo() async {

  String unprocessedUrl = "";
  List<String> urlParts = unprocessedUrl.split('?').toList();
  if (urlParts.length != 0) {
    String finalURL = urlParts.first + "?__a=1";
    Post post = await fetchPost(finalURL);
    _saveImage(post.graphql.shortcodeMedia.displayUrl);
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
                  onPressed: () {

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

class Utils {
  
  Future<String> getClipBoardData() async {
    ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
    return data.text;
  }
}