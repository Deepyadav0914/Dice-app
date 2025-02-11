import 'dart:convert';
import 'package:dio/dio.dart';
import '../Model/dice_model.dart';

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

  // Future<GifsModel> gifsData() async {
  //   try {
  //     var response = await Dio().get(
  //         'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/mm_rewards/stickers.json');
  //
  //     if (response.statusCode == 200) {
  //       return gifsModelFromJson(json.encode(response.data));
  //     } else {
  //       throw Exception('Failed to load data');
  //     }
  //   } catch (e) {
  //     throw Exception('Error: $e');
  //   }
  // }
  //
  // Future<RewardModel> rewardData() async {
  //   try {
  //     var response = await Dio().get(
  //         'https://miracocopepsi.com/admin/mayur/coc/vaibhav/itunesapp/jeet/matchmasterrewards/rewards.json');
  //
  //     if (response.statusCode == 200) {
  //       return rewardModelFromJson(json.encode(response.data));
  //     } else {
  //       throw Exception('Failed to load data');
  //     }
  //   } catch (e) {
  //     throw Exception('Error: $e');
  //   }
  // }
}
