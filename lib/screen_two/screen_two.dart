import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_api/screen_three/screen_three.dart';
import 'package:project_api/screen_two/screen_two_controller.dart';
import 'package:project_api/sign_up_screen/sign_up_screen.dart';

class ScreenTwo extends StatelessWidget {
  ScreenTwo({super.key});

  final ScreenTwoController controller = Get.put(ScreenTwoController());

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
          body: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                    future: controller.getUsers(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return Stack(
                          children: [
                            ListView.builder(
                              itemCount: controller.userList.length,
                              itemBuilder: (context, index) {
                                final userList = controller.userList[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Column(
                                        children: [
                                          UserListWidget(
                                              name: 'Id',
                                              value: userList.id.toString()),
                                          UserListWidget(
                                              name: 'Name',
                                              value: userList.name.toString()),
                                          UserListWidget(
                                              name: 'UserName',
                                              value:
                                                  userList.username.toString()),
                                          UserListWidget(
                                              name: 'Email',
                                              value: userList.email.toString()),
                                          UserListWidget(
                                              name: 'Street',
                                              value: userList.address!.street
                                                  .toString()),
                                          UserListWidget(
                                              name: 'Suite',
                                              value: userList.address!.suite
                                                  .toString()),
                                          UserListWidget(
                                              name: 'City',
                                              value: userList.address!.city
                                                  .toString()),
                                          UserListWidget(
                                              name: 'Zip code',
                                              value: userList.address!.zipcode
                                                  .toString()),
                                          UserListWidget(
                                              name: 'Lat',
                                              value: userList.address!.geo!.lat
                                                  .toString()),
                                          UserListWidget(
                                              name: 'Lng',
                                              value: userList.address!.geo!.lng
                                                  .toString()),
                                          UserListWidget(
                                              name: 'Phone',
                                              value: userList.phone.toString()),
                                          UserListWidget(
                                              name: 'Website',
                                              value:
                                                  userList.website.toString()),
                                          UserListWidget(
                                              name: 'Company Name',
                                              value: userList.company!.name
                                                  .toString()),
                                          UserListWidget(
                                              name: 'Catch phrase',
                                              value: userList
                                                  .company!.catchPhrase
                                                  .toString()),
                                          UserListWidget(
                                              name: 'bs',
                                              value: userList.company!.bs
                                                  .toString()),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => SignUpScreen());
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
                    }),
              ),
            ],
          )),
    );
  }
}

class UserListWidget extends StatelessWidget {
  const UserListWidget({
    super.key,
    required this.name,
    required this.value,
  });

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          Text(value)
        ],
      ),
    );
  }
}
