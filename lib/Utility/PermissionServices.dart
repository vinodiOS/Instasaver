import 'dart:io' show Platform;
import 'package:permission_handler/permission_handler.dart';

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