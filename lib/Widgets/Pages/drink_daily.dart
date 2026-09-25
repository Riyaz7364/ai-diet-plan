import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:unimeal/Data/Controllers/home_controller.dart';

class DrinkDaily extends GetView<HomeController> {
  const DrinkDaily({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(50),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "How much water do you drink daily?",
              textAlign: TextAlign.center,
              style: Get.textTheme.headlineLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "We mean clean water, excluding coffee, tea, and other drinks",
              textAlign: TextAlign.center,
              style: Get.textTheme.titleLarge,
            ),
          ],
        ),
        const Gap(30),
        ...item("any"),
      ],
    );
  }

  List<Widget> item(String gender) {
    final values = {
      "title": [
        "Less than 0.5 L 💧",
        "0.5 - 1.5 L 💧💧",
        "1.5 - 2.5 L 💦",
        "More than 2.5 L 🌊",
        "I don't count; it depends 🤔",
      ],
      "subtitle": [
        "Less than 2 glasses",
        "2-6 glasses",
        "7-10 glasses",
        "More than 10 glasses",
        ""
      ]
    };

    return List.generate(
      values["title"]!.length,
      (index) => Card(
        color: Colors.grey.shade100,
        child: ListTile(
          onTap: () {
            controller.homeModel.value.drinkDaily = values["title"]![index];
            controller.selectedIndex.value += 1;
          },
          title: Text(
            values["title"]![index],
            style: Get.textTheme.titleLarge,
          ),
          subtitle: Text(values["subtitle"]![index]),
        ),
      ).marginOnly(bottom: 10),
    );
  }
}
