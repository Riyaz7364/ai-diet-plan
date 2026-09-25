import 'package:get/get.dart';
import 'package:unimeal/Data/Controllers/langs_controller.dart';
import 'package:unimeal/Data/Controllers/result_controller.dart';

class InitBiningsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LangsController>(() => LangsController());
  }
}

class ResultBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultController>(() => ResultController());
  }
}
