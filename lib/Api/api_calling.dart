import 'dart:convert';
import 'package:dio/dio.dart';
import '../Model/dice_model.dart';
import '../Model/origins_model.dart';
import '../Model/stickers_model.dart';

class ApiCall {
  Future<DiceModel> diceData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/monopoly_deep/dicecode.json');

      if (response.statusCode == 200) {
        print(response.data);
        return diceModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<StickersModel> stickersData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/monopoly_deep/stickers.json');

      if (response.statusCode == 200) {
        return stickersModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<OriginsModel> originsData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/monopoly_deep/origins.json');

      if (response.statusCode == 200) {
        return originsModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
