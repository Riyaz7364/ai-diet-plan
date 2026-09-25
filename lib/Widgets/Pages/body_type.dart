import 'package:flatter/flatter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:unimeal/Data/Controllers/home_controller.dart';

class BodyType extends GetView<HomeController> {
  const BodyType({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(50),
        Text(
          "Your body type",
          textAlign: TextAlign.center,
          style: Get.textTheme.headlineLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
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
      "male": ["Skinny", "Regular", "Extra Plump"],
      "female": ["Regular", "Plump", "Extra Plump"],
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
                  "assets/images/pages/body_type_${index + 1}_$gender.png"),
            )
          ],
        ),
      ).marginOnly(bottom: 10).onTap(() {
        controller.homeModel.value.bodyType = values[gender]![index];
        controller.selectedIndex.value += 1;
      }),
    );
  }
}
