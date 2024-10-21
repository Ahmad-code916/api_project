import 'dart:convert';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:get/get.dart';
import 'package:project_api/models/PostsModel.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  List<PostsModel> postList = [];

  Future<List<PostsModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    } else {
      showOkAlertDialog(
          context: Get.context!,
          title: 'Error',
          message: 'Status code error occurs');
    }
    return postList;
  }
}
