import 'package:flatter/flatter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:unimeal/Data/Controllers/home_controller.dart';

class TendToDo extends GetView<HomeController> {
  const TendToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(50),
            Text(
              "Select all that you tend to do:",
              textAlign: TextAlign.center,
              style: Get.textTheme.headlineLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ).paddingAll(5),
            const Gap(30),
            ...item("any"),
            const Gap(30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GetBuilder<HomeController>(
        id: "updateContinueTendToDo",
        builder: (_) => ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                fixedSize: Size(Get.size.width, 60)),
            onPressed: controller.tendToDo
                    .any((element) => element['selected'] == true)
                ? () {
                    controller.homeModel.value.tendToDo = controller.tendToDo;
                    controller.selectedIndex.value += 1;
                  }
                : null,
            child: Text(
              "Continue",
              style: Get.textTheme.titleLarge!.copyWith(color: Colors.white),
            )),
      ),
    );
  }

  List<Widget> item(String gender) {
    return List.generate(
      controller.tendToDo.length,
      (index) => Card(
        color: Colors.grey.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: GetBuilder<HomeController>(
                      id: "updateTendToDo",
                      builder: (controller) => Checkbox(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                            value:
                                controller.tendToDo[index]['selected'] as bool,
                            onChanged: (value) {
                              controller.tendToDo[index]['selected'] = value!;

                              controller.update(
                                  ['updateTendToDo', "updateContinueTendToDo"]);
                            },
                          )),
                ),
                Text(
                  controller.tendToDo[index]["name"].toString(),
                  style: Get.textTheme.titleLarge,
                ).paddingAll(10),
              ],
            ),
          ],
        ),
      ).marginOnly(bottom: 10),
    );
  }
}
