import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_api/image_upload/image_screen_controller.dart';

class ImageScreen extends StatelessWidget {
  ImageScreen({super.key});

  final ImageScreenController controller = Get.put(ImageScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Api Project',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: GetBuilder<ImageScreenController>(builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Center(
                child: Container(
                  child: controller.image == null
                      ? GestureDetector(
                          onTap: () {
                            controller.pickImage();
                          },
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Text('Select Image')))
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: Image.file(controller.image!.absolute),
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  controller.uploadImage();
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 50, right: 50, top: 10, bottom: 10),
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50)),
                  child: controller.isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Upload Image',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                ),
              ),
            ],
          ),
        );
      }),
    ));
  }
}
