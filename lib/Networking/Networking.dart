  import 'package:dio/dio.dart';
  import 'package:insave/models/Post.dart';
  import 'dart:convert';
  import 'package:image_gallery_saver/image_gallery_saver.dart';
  import 'dart:typed_data';
  import 'package:path_provider/path_provider.dart';

  class Networking {

    Dio dio = new Dio();
    Future<Post> fetchPost(String urlString) async {
      final response = await dio.get(urlString);
      if (response.statusCode == 200) {
        return Post.fromJson(json.decode(response.toString()));
      } else {
        throw Exception('Failed to load post.');
      }
    }

    Future<String> saveImage(String imageURL) async {
      var response = await Dio().get(imageURL, options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
      print(result.toString());
      return result.toString();
    }

    Future<String> downloadFile(String url) async {
      final timeStamp = new DateTime.now().millisecondsSinceEpoch;
      var appDocDir = await getTemporaryDirectory();
      String savePath = appDocDir.path + "$timeStamp.mp4";
      await Dio().download(url, savePath);
      final result = await ImageGallerySaver.saveFile(savePath);
      return result.toString();
    }
  }