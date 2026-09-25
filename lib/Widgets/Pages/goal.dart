import 'package:flatter/flatter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:unimeal/Data/Controllers/home_controller.dart';

class GoalPage extends GetView<HomeController> {
  const GoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(50),
        Text(
          "Сhoose your goal",
          textAlign: TextAlign.center,
          style: Get.textTheme.headlineLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Please select your main issue",
          style: Get.textTheme.titleLarge,
        ),
        const Gap(30),
        Obx(() => Wrap(
              children: [...item(controller.homeModel.value.gender)],
            ))
      ],
    );
  }

  List<Widget> item(String gender) {
    final values = {
      "male": [
        "Muscle Gain",
        "Weight Loss",
      ],
      "female": [
        "Weight Loss",
        "Fit Body",
        "Tone Muscles",
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
            SizedBox(
              height: 100,
              child: Image.asset(
                  fit: BoxFit.cover,
                  "assets/images/pages/goal_${index + 1}_$gender.png"),
            )
          ],
        ),
      ).marginOnly(bottom: 10).onTap(() {
        controller.homeModel.value.goal = values[gender]![index];
        controller.selectedIndex.value += 1;
      }),
    );
  }
}
