import 'package:flatter/flatter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:unimeal/Data/Controllers/home_controller.dart';

class DoYouWorkout extends GetView<HomeController> {
  const DoYouWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(50),
        Text(
          "Do you workout?",
          textAlign: TextAlign.center,
          style: Get.textTheme.headlineLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Workouts boost your weight loss results. We can help you make it a daily habit.",
          style: Get.textTheme.titleLarge,
          textAlign: TextAlign.center,
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
      "any": [
        "No, I don't ❌",
        "Only walks 🏃",
        "1-2 times a week 💪🏼",
        "3-5 times a week 🏋🏽",
        "More than 5 times a week 🔥",
      ],
    };

    return List.generate(
      values["any"]!.length,
      (index) => Card(
        color: Colors.grey.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              values["any"]![index],
              style: Get.textTheme.titleLarge,
            ).paddingAll(10),
          ],
        ).paddingAll(10),
      ).marginOnly(bottom: 10).onTap(() {
        controller.homeModel.value.workout = values["any"]![index];
        controller.selectedIndex.value += 1;
      }),
    );
  }
}
