import 'package:flatter/flatter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:unimeal/Data/Controllers/home_controller.dart';
import 'package:unimeal/Data/global_api.dart';
import 'package:unimeal/Widgets/Pages/body_type.dart';
import 'package:unimeal/Widgets/Pages/body_want.dart';
import 'package:unimeal/Widgets/Pages/drink_daily.dart';
import 'package:unimeal/Widgets/Pages/follow_any_diet.dart';
import 'package:unimeal/Widgets/Pages/goal.dart';
import 'package:unimeal/Widgets/Pages/height.dart';
import 'package:unimeal/Widgets/Pages/how_trired.dart';
import 'package:unimeal/Widgets/Pages/perfetct_weight.dart';
import 'package:unimeal/Widgets/Pages/product_youlike.dart';
import 'package:unimeal/Widgets/Pages/select_age.dart';
import 'package:unimeal/Widgets/Pages/spend_day.dart';
import 'package:unimeal/Widgets/Pages/start.dart';
import 'package:unimeal/Widgets/Pages/target_zone.dart';
import 'package:unimeal/Widgets/Pages/tend_todo.dart';
import 'package:unimeal/Widgets/Pages/usually_sleep.dart';
import 'package:unimeal/Widgets/Pages/workout.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeController = Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 242, 232),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          "AI Mean Plan",
          style: Get.textTheme.headlineSmall!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Obx(() => Visibility(
                visible: homeController.selectedIndex.value > 0,
                child: IconButton(
                  icon: const Icon(
                    Icons.settings_backup_restore_sharp,
                    color: Colors.red,
                    size: 40,
                  ),
                  onPressed: () {
                    homeController.selectedIndex.value -= 1;
                  },
                ),
              ))
        ],
      ),
      body: Obx(() => IndexedStack(
            index: homeController.selectedIndex.value,
            children: const [
              StartPage(),
              SelectAge(),
              GoalPage(),
              BodyType(),
              BodyWant(),
              TargetZone(),
              SpendDay(),
              PerfectWeight(),
              DoYouWorkout(),
              HowTiredPage(),
              HeightPage(),
              TendToDo(),
              UsuallySleepPage(),
              DrinkDaily(),
              FollowAnyDiet(),
              ProductYouLike(),
            ],
          )),
    );
  }
}
