import 'dart:convert';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/PhotoModel.dart';

class ScreenOneController extends GetxController {
  final List<PhotoModel> photosList = [];

  Future<List<PhotoModel>> getPhotos() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        photosList.add(PhotoModel.fromJson(i));
      }
      return photosList;
    } else {
      showOkAlertDialog(
          context: Get.context!, title: 'Error', message: 'Status code error');
    }
    return photosList;
  }
}

class PhotosModel {
  String id, title, url;

  PhotosModel({required this.id, required this.title, required this.url});
}
