import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_api/home_screen/home_screen_controller.dart';
import 'package:project_api/screen_one/screen_one.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                title: const Text(
                  'Api Project',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.blue),
            body: GetBuilder<HomeScreenController>(builder: (context) {
              return Column(
                children: [
                  Expanded(
                    child: FutureBuilder(
                      future: controller.getPostApi(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(child: Text('Loading...'));
                        } else {
                          return Stack(
                            children: [
                              ListView.builder(
                                itemCount: controller.postList.length,
                                itemBuilder: (context, index) {
                                  final postList = controller.postList[index];
                                  return Card(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text.rich(TextSpan(
                                              text: 'Id : ',
                                              children: [
                                                TextSpan(
                                                    text:
                                                        postList.id.toString(),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400))
                                              ],
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.w700))),
                                          Text.rich(TextSpan(
                                              text: 'Title : ',
                                              children: [
                                                TextSpan(
                                                    text: postList.title
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400))
                                              ],
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.w700))),
                                          Text.rich(TextSpan(
                                              text: 'Body : ',
                                              children: [
                                                TextSpan(
                                                    text: postList.body
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400))
                                              ],
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.w700))),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => ScreenOne());
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 50,
                                        right: 50,
                                        top: 10,
                                        bottom: 10),
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 20, bottom: 30),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: const Text(
                                      'Button',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        }
                      },
                    ),
                  )
                ],
              );
            })));
  }
}
