import 'package:easy_localization/easy_localization.dart';

import 'package:flatter/flatter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:unimeal/Data/Controllers/langs_controller.dart';

class SelectLanguageScreen extends GetView<LangsController> {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => SafeArea(
          child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Language setup",
                    style: Get.textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ).container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                  ),
                  const Gap(20),
                  Text(
                    "You can change language in settings later",
                    style: Get.textTheme.titleMedium,
                  ),
                  radioButtonList("English", "en_US"),
                  const Gap(15),
                  radioButtonList("हिंदी", "hi_IN"),
                ],
              )).padding(15),
        ),
      ),
      floatingActionButton: Column(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: tr('i_agree.text')),
                TextSpan(
                  text: tr('i_agree.terms'),
                  style: Get.textTheme.bodyMedium!.copyWith(
                    color: Colors.greenAccent.shade400,
                  ),
                ),
                const TextSpan(text: ", "),
                TextSpan(
                  text: tr('i_agree.polic'),
                  style: Get.textTheme.bodyMedium!.copyWith(
                    color: Colors.greenAccent.shade400,
                  ),
                ),
                const TextSpan(text: ", and "),
                TextSpan(
                  text: tr('i_agree.money_back'),
                  style: Get.textTheme.bodyMedium!.copyWith(
                    color: Colors.greenAccent.shade400,
                  ),
                ),
              ],
            ),
          ).paddingLTRB(20, 10, 20, 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(Get.width * 0.90, 50),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              backgroundColor: Colors.greenAccent.shade700,
            ),
            onPressed: () {
              Logger().d(context.locale.toString());
            },
            child: Text(
              "Continue",
              style: Get.textTheme.titleLarge!.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ).container(
        height: 120,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -0.1), blurRadius: 5, color: Colors.black38)
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget radioButtonList(String name, String locale) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      color: Colors.grey.shade100,
      child: ListTile(
        horizontalTitleGap: 1,
        leading: Transform.scale(
          scale: 1.3,
          child: Radio(
            value: controller.selectedLang.value == locale,
            groupValue: true,
            fillColor: MaterialStateProperty.all(Colors.amber),
            onChanged: (value) {
              controller.changeLocale(locale);
            },
          ),
        ),
        title: Text(
          name,
          style: Get.textTheme.titleLarge,
        ),
      ),
    );
  }
}
