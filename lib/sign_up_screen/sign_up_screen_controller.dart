import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:project_api/screen_three/screen_three.dart';

class SignUpScreenController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void signUp() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showOkAlertDialog(
          context: Get.context!, title: 'Error', message: 'Enter Fields');
    } else {
      try {
        isLoading = true;
        update();
        final response =
            await post(Uri.parse("https://reqres.in/api/register"), body: {
          'email': emailController.text,
          'password': passwordController.text,
        });
        if (response.statusCode == 200) {
          Get.snackbar('Congratulations', 'Account created successfully');
          Get.to(() => LoginScreen());
          isLoading = false;
          update();
        } else {
          isLoading = false;
          update();
          Get.snackbar('Error', 'Signup Failed');
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
