import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:project_api/models/DropDownModel.dart';
import 'package:http/http.dart' as http;

class DropDownController extends GetxController {
  List<DropDownModel> dropDownList = [];
  List<DropDownModel> dataList = [];

  Future<List<DropDownModel>> getData() async {
    try {
      print('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^');
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (Map i in data) {
          dataList.add(DropDownModel.fromJson(i));
          update();
        }
        return dataList;
      } else {
        throw Exception('Status Code Error');
      }
    } on SocketException {
      throw Exception('No Internet');
    }
  }

  /* Future<List<DropDownModel>> getData() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      final body = jsonDecode(response.body) as List;
      if (response.statusCode == 200) {
        return body.map(
          (e) {
            final map = e as Map<String, dynamic>;
            return DropDownModel(
              id: map['id'],
              userId: map['userId'],
              title: map['title'],
              body: map['body'],
            );
          },
        ).toList();
      } else {
        throw Exception('Status Code Error');
      }
    } on SocketException {
      throw Exception('No Internet');
    }
  }*/

  String? selectedValue;

  void onChange(String val) {
    selectedValue = val;
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
