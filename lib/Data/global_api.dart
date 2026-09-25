import 'package:dio/dio.dart';
import 'package:get/get_connect/connect.dart';
import 'package:logger/logger.dart';
import 'package:unimeal/Data/Models/choices.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class Api extends GetConnect {
  Future<dynamic> getDietPlan(HomeModel model) async {
    const api = "https://miner.autolikerlive.com/api/chat/dietplan";

    final form = {
      'gender': model.gender,
      'age': model.age,
      'body_type': model.bodyType,
      'body_i_want': model.bodyWant,
      'target_zone': listToAnd(model.targetZone!),
      'spend_day': model.spendDay,
      'last_perfect': model.perfectWeight,
      'do_i_workout': model.workout,
      'how_tired': model.howTired,
      'height': model.height,
      'weight': model.currentWeight,
      'goal': model.goal,
      'goal_weight': model.goalWeight,
      'what_i_do': listToAnd(model.tendToDo!),
      'usually_sleep': model.usuallySleep,
      'drink_daily': model.drinkDaily,
      'my_diets': model.followDiets,
      'products_like': listToAnd(model.productsYouLike!, products: true),
    };

    var dio = Dio();
    var response = await dio.request(
      'https://miner.autolikerlive.com/api/chat/dietplan',
      options: Options(
        method: 'POST',
      ),
      data: form,
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      Logger().e(response.statusMessage);
    }

    // print(response.bodyString);
  }

  String listToAnd(List<Map<String, dynamic>> list, {bool products = false}) {
    final myList = <String>[];
    if (!products) {
      for (var item in list) {
        if (item['selected'] == true) {
          myList.add(item['name']);
        }
      }
    } else {
      for (var items in list) {
        items.forEach((key, value) {
          for (var item in value) {
            if (item['selected'] == true) {
              myList.add(item['name']);
            }
          }
        });
      }
    }

    int listLength = myList.length;
    String result;

    if (listLength == 1) {
      result = myList[0];
    } else if (listLength == 2) {
      result = '${myList[0]} & ${myList[1]}';
    } else {
      String lastElement = myList.removeLast();
      result = '${myList.join(', ')} & $lastElement';
    }

    return result;
  }
}
