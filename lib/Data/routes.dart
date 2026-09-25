import 'package:get/get.dart';
import 'package:unimeal/Data/bindings.dart';
import 'package:unimeal/Screens/home_screen.dart';
import 'package:unimeal/Screens/result.dart';
import 'package:unimeal/Screens/select_language_screen.dart';

class Routes {
  static const selectLangs = "/";
  static const homePage = "/homePage";
  static const result = "/result";

  static List<GetPage> pages = [
    GetPage(
      name: selectLangs,
      page: () => const SelectLanguageScreen(),
    ),
    GetPage(
      name: homePage,
      page: () => HomeScreen(),
    ),
    GetPage(
        name: result,
        page: () => const ResultScreen(),
        binding: ResultBinding()),
  ];
}
