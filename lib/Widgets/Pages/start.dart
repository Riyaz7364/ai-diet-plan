import 'package:flatter/flatter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:unimeal/Data/Controllers/home_controller.dart';

class StartPage extends GetView<HomeController> {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(20),
        Text(
          "Become The Better Version Of Yourself",
          style: Get.textTheme.headlineMedium!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(30),
        Text(
          "Take our Quiz to get a personal meal plan and achieve your weight goals!",
          style: Get.textTheme.titleLarge!.copyWith(color: Colors.black54),
          textAlign: TextAlign.center,
        ),
        const Gap(20),
        Text(
          "Select your gender",
          textAlign: TextAlign.center,
          style: Get.textTheme.titleLarge!.copyWith(
            color: Colors.black,
          ),
        ),
        const Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade300,
                fixedSize: const Size(150, 50),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                controller.homeModel.value.gender = "male";
                controller.selectedIndex.value += 1;
              },
              icon: const Icon(
                Icons.male,
                size: 30,
              ),
              label: const Text("Male").textScale(1.4),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                fixedSize: const Size(150, 50),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                controller.homeModel.value.gender = "female";
                controller.selectedIndex.value += 1;
                controller.homeModel.refresh();
              },
              icon: const Icon(
                Icons.female,
                size: 30,
              ),
              label: const Text("Female").textScale(1.4),
            ),
          ],
        )
      ],
    ).paddingAll(10);
  }
}
