import 'package:get/get.dart';

class HomeModel extends GetxController {
  String gender;
  String? age;
  String? goal;
  String? bodyType;
  String? bodyWant;
  List<Map<String, dynamic>>? targetZone;
  String? spendDay;
  String? perfectWeight;
  String? workout;
  String? howTired;
  String? height;
  String? currentWeight;
  String? goalWeight;
  String? weightType;
  List<Map<String, dynamic>>? tendToDo;
  String? usuallySleep;
  String? drinkDaily;
  String? followDiets;
  List<Map<String, dynamic>>? productsYouLike;

  HomeModel({
    required this.gender,
    this.age,
    this.goal,
    this.bodyType,
    this.bodyWant,
    this.targetZone,
    this.spendDay,
    this.perfectWeight,
    this.workout,
    this.howTired,
    this.height,
    this.currentWeight,
    this.goalWeight,
    this.weightType,
    this.tendToDo,
    this.usuallySleep,
    this.drinkDaily,
    this.followDiets,
    this.productsYouLike,
  });

  factory HomeModel.fromPartialJson(Map<String, dynamic> json) {
    return HomeModel(
      gender: json['gender'],
      age: json['age'],
      goal: json['goal'],
      bodyType: json['bodyType'],
      bodyWant: json['bodyWant'],
      targetZone: json['targetZone'] != null
          ? List<Map<String, dynamic>>.from(json['targetZone'])
          : null,
      spendDay: json['spendDay'],
      perfectWeight: json['perfectWeight'],
      workout: json['workout'],
      howTired: json['howTired'],
      height: json['height'],
      currentWeight: json['currentWeight'],
      goalWeight: json['goalWeight'],
      weightType: json['weightType'],
      tendToDo: json['tendToDo'] != null
          ? List<Map<String, dynamic>>.from(json['tendToDo'])
          : null,
      usuallySleep: json['usuallySleep'],
      drinkDaily: json['drinkDaily'],
      followDiets: json['followDiets'],
      productsYouLike: json['productsYouLike'] != null
          ? List<Map<String, dynamic>>.from(json['productsYouLike'])
          : null,
    );
  }
}
