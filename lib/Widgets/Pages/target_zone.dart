import 'package:flatter/flatter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:unimeal/Data/Controllers/home_controller.dart';

class TargetZone extends GetView<HomeController> {
  const TargetZone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Gap(50),
          Text(
            "Your target zones",
            textAlign: TextAlign.center,
            style: Get.textTheme.headlineLarge!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(30),
          Obx(() => Wrap(
                children: [...item(controller.homeModel.value.gender)],
              )),
          const Gap(30),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GetBuilder<HomeController>(
        id: "updateContinueTargetZone",
        builder: (_) => ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                fixedSize: Size(Get.size.width, 60)),
            onPressed: controller.targetZone[controller.homeModel.value.gender]!
                    .any((element) => element['selected'] == true)
                ? () {
                    controller.homeModel.value.targetZone = controller
                        .targetZone[controller.homeModel.value.gender];
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
      controller.targetZone[gender]!.length,
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
                      id: "updateTargetZone",
                      builder: (controller) => Checkbox(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                            value: controller.targetZone[gender]![index]
                                ['selected'] as bool,
                            onChanged: (value) {
                              controller.targetZone[gender]![index]
                                  ['selected'] = value!;

                              controller.update([
                                'updateTargetZone',
                                "updateContinueTargetZone"
                              ]);
                            },
                          )),
                ),
                Text(
                  controller.targetZone[gender]![index]["name"].toString(),
                  style: Get.textTheme.titleLarge,
                ).paddingAll(10),
              ],
            ),
            SizedBox(
              height: 100,
              child: Image.asset(
                  fit: BoxFit.cover,
                  "assets/images/pages/target_zone_${index + 1}_$gender.png"),
            )
          ],
        ),
      ).marginOnly(bottom: 10),
    );
  }
}
