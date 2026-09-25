import 'dart:convert';

import 'package:get/get.dart';
import 'package:unimeal/Data/Controllers/home_controller.dart';
import 'package:unimeal/Data/global_api.dart';

class ResultController extends GetxController with StateMixin<dynamic> {
  final homeController = Get.find<HomeController>();

  Future<void> getDietResult() async {
    final result = await Api().getDietPlan(homeController.homeModel.value);
    print(result['result']);
    if (result['status']) {
      change(result['result'], status: RxStatus.success());
    } else {
      change([], status: RxStatus.error());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDietResult();
  }
}
