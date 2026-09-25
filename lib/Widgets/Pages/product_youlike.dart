import 'package:flatter/flatter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:unimeal/Data/Controllers/home_controller.dart';
import 'package:unimeal/Data/routes.dart';

class ProductYouLike extends GetView<HomeController> {
  const ProductYouLike({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Gap(50),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Choose the products you like",
              textAlign: TextAlign.center,
              style: Get.textTheme.headlineLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Gap(30),
        ...item(),
        GetBuilder<HomeController>(
          id: "updateContinueProductYouLike",
          builder: (_) => ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: Size(Get.size.width, 60)),
              onPressed: controller.productsYouLike.any((element) =>
                      element.values.any((innerList) => innerList
                          .any((itemList) => itemList['selected'] == true)) ==
                      true)
                  ? () {
                      controller.homeModel.value.productsYouLike =
                          controller.productsYouLike;
                      Get.toNamed(Routes.result);
                    }
                  : null,
              child: Text(
                "Continue",
                style: Get.textTheme.titleLarge!.copyWith(color: Colors.white),
              )),
        )
      ],
    );
  }

  List<Widget> item() {
    final list = [
      "Veggies",
      "Grains & Breads",
      "Meat & Eggs",
    ];

    final listIcon = [
      "🥕",
      "🍛",
      "🥩",
    ];

    return List.generate(
        list.length,
        (index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${list[index]} ${listIcon[index]}",
                  style: Get.textTheme.titleLarge,
                ).marginOnly(bottom: 20),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 4.5,
                  children: List.generate(
                    controller.productsYouLike[index][list[index]]!.length,
                    (index2) => GetBuilder<HomeController>(
                      id: "updateProductListItem",
                      builder: (_) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 9),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: Colors.amber,
                              width: controller.productsYouLike[index]
                                          [list[index]]![index2]['selected'] ==
                                      true
                                  ? 3
                                  : 0,
                            ),
                            color: const Color.fromARGB(255, 245, 235, 146)),
                        child: Text(
                          controller.productsYouLike[index]
                                  [list[index]]![index2]['name']
                              .toString(),
                          textAlign: TextAlign.center,
                          style: Get.textTheme.bodyLarge,
                        ),
                      ).onTap(
                        () {
                          if (controller.productsYouLike[index]
                                  [list[index]]![index2]['selected'] ==
                              false) {
                            controller.productsYouLike[index]
                                [list[index]]![index2]['selected'] = true;
                          } else {
                            controller.productsYouLike[index]
                                [list[index]]![index2]['selected'] = false;
                          }
                          controller.update([
                            'updateProductListItem',
                            'updateContinueProductYouLike'
                          ]);
                        },
                      ),
                    ),
                  ),
                )
              ],
            ).paddingAll(20));
  }
}
