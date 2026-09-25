import 'package:flatter/flatter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:unimeal/Data/Controllers/home_controller.dart';

class HowTiredPage extends GetView<HomeController> {
  const HowTiredPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(50),
        Text(
          "How tired do you typically feel during the day?",
          textAlign: TextAlign.center,
          style: Get.textTheme.headlineLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Our weight loss programs help you keep your energy level steady throughout the day.",
          style: Get.textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const Gap(30),
        ...item("any"),
      ],
    );
  }

  List<Widget> item(String gender) {
    final values = {
      "any": [
        "I feel tired all day long",
        "I feel tired before meals",
        "I have a couple of afternoon yawns",
        "I'm a ball of fire all day long",
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
        controller.homeModel.value.howTired = values[gender]![index];
        controller.selectedIndex.value += 1;
      }),
    );
  }
}
