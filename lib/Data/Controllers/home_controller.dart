import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimeal/Data/Models/choices.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;
  final homeModel = HomeModel(gender: "male").obs;
  final allowTerms = false.obs;
  final allowUpdates = false.obs;
  final heightInCm = true.obs;
  final heightTextController = TextEditingController().obs;
  final currentWeigthTextController = TextEditingController().obs;
  final goalWeigthTextController = TextEditingController().obs;
  Future<void> updateChoice(HomeModel choice) async {}

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  final targetZone = {
    "male": [
      {"name": "Abs", "selected": false},
      {"name": "Arms & Chest", "selected": false},
      {"name": "Legs", "selected": false},
    ],
    "female": [
      {"name": "Slim Legs", "selected": false},
      {"name": "Toned Butt", "selected": false},
      {"name": "Perky Breasts", "selected": false},
      {"name": "Flat Belly", "selected": false},
    ]
  }.obs;

  final tendToDo = [
    {"name": "I eat late at night 🍕", "selected": false},
    {"name": "I can't give up eating sweets 🧁", "selected": false},
    {"name": "I love soft drinks 🍹", "selected": false},
    {"name": "I consume hard drinks 🍺", "selected": false},
    {"name": "I love fatty or salty foods 🥞", "selected": false},
    {"name": "None of the above 🔴", "selected": false},
  ].obs;

  final productsYouLike = [
    {
      "Veggies": [
        {"name": "Tomato", "selected": false},
        {"name": "Cucumber", "selected": true},
        {"name": "Bell pepper", "selected": true},
        {"name": "Onion", "selected": true},
        {"name": "Spinach", "selected": true},
        {"name": "Mushrooms", "selected": true},
        {"name": "Cocktail tomatoes", "selected": true},
        {"name": "Lettuce", "selected": true},
        {"name": "Zucchini", "selected": true},
        {"name": "Carrots", "selected": true},
      ],
    },
    {
      "Grains & Breads": [
        {"name": "Rice", "selected": false},
        {"name": "Spaghetti", "selected": false},
        {"name": "Whole grain bread", "selected": false},
        {"name": "Couscous", "selected": false},
        {"name": "Quick-cooking oats", "selected": false},
        {"name": "Quinoa", "selected": false},
      ],
    },
    {
      "Meat & Eggs": [
        {"name": "Eggs", "selected": false},
        {"name": "Chicken breast", "selected": false},
        {"name": "Turkey breast", "selected": false},
        {"name": "Chicken sausage", "selected": false},
        {"name": "Chicken ham", "selected": false},
        {"name": "Ground chicken", "selected": false},
        {"name": "Beef", "selected": false},
      ]
    }
  ];
}
