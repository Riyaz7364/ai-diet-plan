import 'package:flatter/flatter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:unimeal/Data/Controllers/home_controller.dart';

class PerfectWeight extends GetView<HomeController> {
  const PerfectWeight({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(50),
        Text(
          "When were you last at your perfect weight?",
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
      ],
    );
  }

  List<Widget> item(String gender) {
    final values = {
      "male": [
        "0 - 6 months ago",
        "7 - 12 months ago",
        "1 - 3 years ago",
        "More than 3 years ago",
      ],
      "female": [
        "Less than a year ago",
        "1 - 3 years ago",
        "More than 3 years ago",
        "Never",
      ]
    };

    return List.generate(
      values[gender]!.length,
      (index) => Card(
        color: Colors.grey.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              values[gender]![index],
              style: Get.textTheme.titleLarge,
            ).paddingAll(10),
          ],
        ).paddingAll(10),
      ).marginOnly(bottom: 10).onTap(() {
        controller.homeModel.value.perfectWeight = values[gender]![index];
        controller.selectedIndex.value += 1;
      }),
    );
  }
}
