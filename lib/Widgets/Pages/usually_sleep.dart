import 'package:flatter/flatter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:unimeal/Data/Controllers/home_controller.dart';

class UsuallySleepPage extends GetView<HomeController> {
  const UsuallySleepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(50),
        Text(
          "How much do you usually sleep?",
          textAlign: TextAlign.center,
          style: Get.textTheme.headlineLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ).paddingAll(5),
        const Gap(30),
        ...item("any"),
      ],
    );
  }

  List<Widget> item(String gender) {
    final values = {
      "any": [
        "Less than 5 hours",
        "5-6 hours",
        "7-8 hours",
        "More than 8 hours",
      ]
    };

    return List.generate(
      values[gender]!.length,
      (index) => Card(
        color: Colors.grey.shade100,
        child: ListTile(
          onTap: () {
            controller.homeModel.value.usuallySleep = values[gender]![index];
            controller.selectedIndex.value += 1;
          },
          title: Text(
            values[gender]![index],
            style: Get.textTheme.titleLarge,
          ).paddingAll(10),
        ),
      ).marginOnly(bottom: 10),
    );
  }
}
