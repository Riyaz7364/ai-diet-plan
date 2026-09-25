import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:unimeal/Data/Controllers/result_controller.dart';

class ResultScreen extends GetView<ResultController> {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Diet"),
      ),
      body: controller.obx((state) => ListView(
            children: [
              const Gap(10),
              HtmlWidget(state).paddingAll(15),
              const Gap(10),
            ],
          )),
    );
  }
}
