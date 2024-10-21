import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_api/drop_down_data/drop_down_data_controller.dart';
import 'package:project_api/models/DropDownModel.dart';

class DropDownData extends StatelessWidget {
  DropDownData({super.key});

  final DropDownController controller = Get.put(DropDownController());

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
            body: GetBuilder<DropDownController>(builder: (context) {
              return Column(
                children: [
                  const SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: const Text('Select value'),
                        isExpanded: true,
                        value: controller.selectedValue,
                        items: controller.dataList.map(
                          (e) {
                            return DropdownMenuItem(
                                value: e.id.toString(),
                                child: Text(e.id.toString()));
                          },
                        ).toList(),
                        onChanged: (value) {
                          controller.onChange(value!);
                        },
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: controller.dataList.length,
                  //     itemBuilder: (context, index) {
                  //       return
                  //     },
                  //   ),
                  // ),
                  /*FutureBuilder(
                    future: controller.getData(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Expanded(
                            child: Center(
                          child: CircularProgressIndicator(),
                        ));
                      } else {
                        return DropdownButton(
                          value: controller.selectedValue,
                          hint: Text('Select value'),
                          isExpanded: true,
                          items: snapshot.data!.map(
                            (e) {
                              return DropdownMenuItem(
                                  value: e.id.toString(),
                                  child: Text(e.id.toString()));
                            },
                          ).toList(),
                          onChanged: (value) {
                            controller.onChange(value!);
                          },
                        );
                      }
                    },
                  ),*/
                ],
              );
            })));
  }
}
