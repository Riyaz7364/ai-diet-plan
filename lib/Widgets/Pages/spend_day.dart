import 'package:flatter/flatter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:unimeal/Data/Controllers/home_controller.dart';

class SpendDay extends GetView<HomeController> {
  const SpendDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(50),
        Text(
          "How do you typically spend your day?",
          textAlign: TextAlign.center,
          style: Get.textTheme.headlineLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Choose what takes up most of your time.",
          style: Get.textTheme.titleLarge,
        ),
        const Gap(30),
        ...item(),
      ],
    );
  }

  List<Widget> item() {
    final values = [
      "Sitting all day long at work",
      "I'm always on my feet",
      "Doing lots of physical activity",
      "Staying at home",
    ];

    return List.generate(
      values.length,
      (index) => Card(
        color: Colors.grey.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              values[index],
              style: Get.textTheme.titleLarge,
            ).paddingAll(10),
          ],
        ).paddingAll(10),
      ).marginOnly(bottom: 10).onTap(() {
        controller.homeModel.value.spendDay = values[index];
        controller.selectedIndex.value += 1;
      }),
    );
  }
}
