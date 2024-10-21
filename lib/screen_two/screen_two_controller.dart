import 'dart:convert';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:get/get.dart';
import 'package:project_api/models/UsersModel.dart';
import 'package:http/http.dart' as http;

class ScreenTwoController extends GetxController {
  final List<UsersModel> userList = [];

  Future<List<UsersModel>> getUsers() async {
    userList.clear();
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UsersModel.fromJson(i));
      }
      return userList;
    } else {
      showOkAlertDialog(
          context: Get.context!,
          title: 'Error',
          message: 'Status code error occurs');
    }
    return userList;
  }
}
