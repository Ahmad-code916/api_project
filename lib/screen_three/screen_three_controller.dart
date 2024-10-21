import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:project_api/image_upload/image_screen.dart';

class LoginScreenController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void logIn() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showOkAlertDialog(
          context: Get.context!, title: 'Error', message: 'Enter Fields');
    } else {
      try {
        isLoading = true;
        update();
        final response =
            await post(Uri.parse("https://reqres.in/api/login"), body: {
          'email': emailController.text,
          'password': passwordController.text,
        });
        if (response.statusCode == 200) {
          Get.snackbar('Congratulations', 'Login successfully');
          Get.to(() => ImageScreen());
          isLoading = false;
          update();
        } else {
          isLoading = false;
          update();
          Get.snackbar('Congratulations', 'Login failed');
        }
      } catch (e) {
        isLoading = false;
        update();
        showOkAlertDialog(
            context: Get.context!, title: 'Error', message: e.toString());
      }
    }
  }
}
