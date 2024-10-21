import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_api/screen_one/screen_one_controller.dart';
import 'package:project_api/screen_two/screen_two.dart';

class ScreenOne extends StatelessWidget {
  ScreenOne({super.key});

  final ScreenOneController controller = Get.put(ScreenOneController());

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
        body: GetBuilder<ScreenOneController>(builder: (context) {
          return Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: controller.getPhotos(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: Text('Loading...'));
                    } else {
                      return Stack(
                        children: [
                          ListView.builder(
                            itemCount: controller.photosList.length,
                            itemBuilder: (context, index) {
                              final photoList = controller.photosList[index];
                              return Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          photoList.url.toString()),
                                    ),
                                    title: Text.rich(TextSpan(
                                        text: '${photoList.id} Title : ',
                                        children: [
                                          TextSpan(
                                              text: photoList.title.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400))
                                        ],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700))),
                                  ),
                                  const Divider(),
                                ],
                              );
                            },
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => ScreenTwo());
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 50, right: 50, top: 10, bottom: 10),
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 30),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50)),
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
        }),
      ),
    );
  }
}
