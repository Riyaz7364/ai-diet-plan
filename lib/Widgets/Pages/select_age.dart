import 'package:flatter/flatter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:unimeal/Data/Controllers/home_controller.dart';

class SelectAge extends GetView<HomeController> {
  const SelectAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "WEIGHT-LOSS PLAN",
          textAlign: TextAlign.center,
          style: Get.textTheme.headlineLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "According to your age",
          style: Get.textTheme.titleLarge,
        ),
        Obx(() => GridView.count(
              shrinkWrap: true,
              childAspectRatio: 1.1,
              crossAxisCount: 2,
              children: item(controller.homeModel.value.gender),
            )),
        const Gap(50),
        Row(
          children: [
            Transform.scale(
              scale: 1.5,
              child: Obx(() => Checkbox(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    value: controller.allowTerms.value,
                    onChanged: (value) {
                      controller.allowTerms.toggle();
                    },
                  )),
            ).marginOnly(right: 10),
            SizedBox(
              width: Get.size.width * 0.75,
              child: const Text(
                  "By continuing, I agree with Terms of Service, Privacy Policy, Money-Back Policy, Subscription terms, Cookie policy"),
            )
          ],
        ),
        const Gap(20),
        Row(
          children: [
            Transform.scale(
              scale: 1.5,
              child: Obx(() => Checkbox(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    value: controller.allowUpdates.value,
                    onChanged: (value) {
                      controller.allowUpdates.toggle();
                    },
                  )),
            ).marginOnly(right: 10),
            SizedBox(
              width: Get.size.width * 0.75,
              child: const Text(
                  "I would like to receive updates about products, services, and special offers from Unimeal via email"),
            )
          ],
        ),
        const Expanded(child: SizedBox()),
      ],
    ).paddingAll(10);
  }

  List<Widget> item(String gender) {
    final ages = [
      "18-25",
      "26-35",
      "36-45",
      "46+",
    ];

    return List.generate(
      4,
      (index) => Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/pages/page_1_${index + 1}_${gender}_age.png"),
          ),
        ),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Text(
            ages[index],
            style: Get.textTheme.titleLarge,
          ).center().container(
              height: 40,
              width: 180,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(255, 184, 168, 171))),
        ),
      ).onTap(() {
        if (controller.allowTerms.isTrue) {
          controller.homeModel.value.age = ages[index];
          controller.selectedIndex.value += 1;
        } else {
          Fluttertoast.showToast(
              msg: "Please allow Terms & Policys before continue.");
        }
      }),
    );
  }
}
