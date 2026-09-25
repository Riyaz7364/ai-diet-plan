import 'package:flatter/flatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:unimeal/Data/Controllers/home_controller.dart';

class FollowAnyDiet extends GetView<HomeController> {
  const FollowAnyDiet({super.key});

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
              "Do you follow any of these diets?",
              textAlign: TextAlign.center,
              style: Get.textTheme.headlineLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Gap(30),
        ...item("any"),
        const SizedBox().expanded(),
      ],
    );
  }

  List<Widget> item(String gender) {
    final values = {
      "any": [
        "I'm lactose intolerant",
        "I don't eat gluten",
        "I'm vegetarian",
        "I'm vegan",
        "None of the above",
      ]
    };

    return List.generate(
      values["any"]!.length,
      (index) => Card(
        color: Colors.grey.shade100,
        child: ListTile(
          onTap: () {
            controller.homeModel.value.followDiets = values["any"]![index];
            controller.selectedIndex.value += 1;
          },
          title: Text(
            values["any"]![index],
            style: Get.textTheme.titleLarge,
          ),
          subtitle: Text(values["any"]![index]),
        ),
      ).marginOnly(bottom: 10),
    );
  }
}
