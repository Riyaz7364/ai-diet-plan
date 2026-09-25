import 'package:flatter/flatter.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:unimeal/Data/Controllers/home_controller.dart';

class HeightPage extends GetView<HomeController> {
  const HeightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Gap(50),
          Text(
            "Fill your details?",
            textAlign: TextAlign.center,
            style: Get.textTheme.headlineLarge!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(30),
          Container(
            width: Get.width * 0.9,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(color: Colors.black26),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    Obx(() => AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          width: controller.heightInCm.isTrue
                              ? Get.width * 0.435
                              : Get.width * 0.01,
                        )),
                    Container(
                      height: 60,
                      width: Get.width * 0.45,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ).marginOnly(),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Obx(() => TextButton(
                          style: TextButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                              fixedSize: const Size(150, 50)),
                          onPressed: controller.heightInCm.isFalse
                              ? null
                              : () {
                                  controller.heightInCm.value = false;
                                  if (controller.heightTextController.value.text
                                      .isNotEmpty) {
                                    controller.heightTextController.value.text =
                                        cmToFeet(controller
                                            .heightTextController.value.text);
                                  }
                                  if (controller.currentWeigthTextController
                                      .value.text.isNotEmpty) {
                                    controller.currentWeigthTextController.value
                                            .text =
                                        kgToLbFormatted(controller
                                            .currentWeigthTextController
                                            .value
                                            .text);
                                  }
                                  if (controller.goalWeigthTextController.value
                                      .text.isNotEmpty) {
                                    controller.goalWeigthTextController.value
                                            .text =
                                        kgToLbFormatted(controller
                                            .goalWeigthTextController
                                            .value
                                            .text);
                                  }
                                },
                          child: Text(
                            "lb, ft",
                            style: Get.textTheme.headlineSmall,
                          ))),
                      Obx(
                        () => TextButton(
                            style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                                fixedSize: const Size(150, 50)),
                            onPressed: controller.heightInCm.isTrue
                                ? null
                                : () {
                                    controller.heightInCm.value = true;
                                    if (controller.heightTextController.value
                                        .text.isNotEmpty) {
                                      controller
                                              .heightTextController.value.text =
                                          feetToCm(controller
                                              .heightTextController.value.text);
                                    }
                                    if (controller.currentWeigthTextController
                                        .value.text.isNotEmpty) {
                                      controller.currentWeigthTextController
                                              .value.text =
                                          lbToKgFormatted(controller
                                              .currentWeigthTextController
                                              .value
                                              .text);
                                    }
                                    if (controller.goalWeigthTextController
                                        .value.text.isNotEmpty) {
                                      controller.goalWeigthTextController.value
                                              .text =
                                          lbToKgFormatted(controller
                                              .goalWeigthTextController
                                              .value
                                              .text);
                                    }
                                  },
                            child: Text(
                              "kg, cm",
                              style: Get.textTheme.headlineSmall,
                            )),
                      )
                    ]).marginOnly(top: 10),
              ],
            ),
          ).center(),
          const Gap(20),
          Obx(
            () => TextField(
              controller: controller.heightTextController.value,
              keyboardType: TextInputType.number,
              maxLength: 5,
              decoration: InputDecoration(
                  filled: true,
                  counterText: "",
                  fillColor: Colors.white,
                  label: Text(
                      "Height (in ${controller.heightInCm.isTrue ? "Centimeter" : "Feet"})"),
                  border: const OutlineInputBorder()),
              onChanged: (value) {
                controller.update(["updateContinueHeight"]);
              },
            ).paddingAll(15),
          ),
          Obx(
            () => TextField(
              controller: controller.currentWeigthTextController.value,
              keyboardType: TextInputType.number,
              maxLength: 5,
              decoration: InputDecoration(
                  filled: true,
                  counterText: "",
                  fillColor: Colors.white,
                  label: Text(
                      "Current weight (${controller.heightInCm.isTrue ? "kg" : "lb"})"),
                  border: const OutlineInputBorder()),
              onChanged: (value) {
                controller.update(["updateContinueHeight"]);
              },
            ).paddingAll(15),
          ),
          Obx(
            () => TextField(
                controller: controller.goalWeigthTextController.value,
                keyboardType: TextInputType.number,
                maxLength: 5,
                decoration: InputDecoration(
                    filled: true,
                    counterText: "",
                    fillColor: Colors.white,
                    label: Text(
                        "Goal weight (${controller.heightInCm.isTrue ? "kg" : "lb"})"),
                    border: const OutlineInputBorder()),
                onChanged: (value) {
                  controller.update(["updateContinueHeight"]);
                }).paddingAll(15),
          ),
          const Gap(50)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GetBuilder<HomeController>(
        id: "updateContinueHeight",
        builder: (_) => ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              fixedSize: Size(Get.size.width, 60)),
          onPressed: (controller.heightTextController.value.text.isNotEmpty &&
                  controller
                      .currentWeigthTextController.value.text.isNotEmpty &&
                  controller.goalWeigthTextController.value.text.isNotEmpty)
              ? () {
                  final currentWeight =
                      controller.currentWeigthTextController.value.text;
                  final goalWeight =
                      controller.goalWeigthTextController.value.text;
                  controller.homeModel.value.height =
                      controller.heightTextController.value.text;
                  controller.homeModel.value.currentWeight = currentWeight;
                  controller.homeModel.value.goalWeight = goalWeight;
                  if (double.parse(currentWeight) > double.parse(goalWeight)) {
                    controller.homeModel.value.weightType = "gain";
                  } else {
                    controller.homeModel.value.weightType = "loose";
                  }
                  controller.selectedIndex.value += 1;
                  FocusScope.of(context).unfocus();
                }
              : null,
          child: Text(
            "Continue",
            style: Get.textTheme.titleLarge!.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  String feetToCm(String feet) {
    final value = double.parse(feet);
    const double cmPerFoot = 30.48;
    return (value * cmPerFoot).toStringAsFixed(2);
  }

  String cmToFeet(String cm) {
    final value = double.parse(cm);
    const double feetPerCm = 1 / 30.48;
    return (value * feetPerCm).toStringAsFixed(2);
  }

  String formatToTwoDecimalPlaces(double value) {
    return value.toStringAsFixed(2);
  }

  String kgToLbFormatted(String kg) {
    final value = double.parse(kg);
    const double lbPerKg = 2.20462;
    double lbValue = value * lbPerKg;
    return formatToTwoDecimalPlaces(lbValue);
  }

  String lbToKgFormatted(String lb) {
    final value = double.parse(lb);
    const double kgPerLb = 0.453592;
    double kgValue = value * kgPerLb;
    return formatToTwoDecimalPlaces(kgValue);
  }
}
