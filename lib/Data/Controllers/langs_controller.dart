import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LangsController extends GetxController with StateMixin<dynamic> {
  final selectedLang = "".obs;

  void changeLocale(String locale) {
    selectedLang.value = locale;
    final newLocal = locale.toLocale();
    EasyLocalization.of(Get.context!)!.setLocale(newLocal);
    change([], status: RxStatus.success());
    Get.updateLocale(newLocal);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedLang.value = EasyLocalization.of(Get.context!)!.locale.toString();
    change([], status: RxStatus.success());
  }
}
