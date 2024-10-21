import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:project_api/drop_down_data/drop_down_data.dart';

class ImageScreenController extends GetxController {
  File? image;
  var isLoading = false;

  Future pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    } else {
      showOkAlertDialog(
          context: Get.context!, title: 'Error', message: 'Image not selected');
    }
  }

  Future uploadImage() async {
    try {
      isLoading = true;
      update();
      var stream = http.ByteStream(image!.openRead());
      stream.cast();
      var length = await image!.length();
      var uri = Uri.parse("https://fakestoreapi.com/products");
      var request = http.MultipartRequest('POST', uri);

      // request.fields['title'] = 'Static string';
      var multipart = http.MultipartFile('image', stream, length);
      request.files.add(multipart);

      final response = await request.send();
      Get.to(() => DropDownData());
      isLoading = false;
      update();
      if (response.statusCode == 200) {
        Get.snackbar('Congratulations', "Image Uploaded");
      } else {
        isLoading = false;
        update();
        Get.snackbar('Error', "Image uploaded failed");
      }
    } catch (e) {
      showOkAlertDialog(
          context: Get.context!, title: 'Error', message: e.toString());
    }
  }
}
