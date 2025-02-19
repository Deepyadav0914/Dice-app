import 'dart:convert';
import 'package:dio/dio.dart';
import '../Model/dice_model.dart';
import '../Model/events_Model.dart';
import '../Model/faqs_model.dart';
import '../Model/origins_model.dart';
import '../Model/shield_model.dart';
import '../Model/stickers_model.dart';
import '../Model/tokens_model.dart';

class ApiCall {
  Future<DiceModel> diceData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/monopoly_deep/dicecode.json');

      if (response.statusCode == 200) {
        // print(response.data);
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

  Future<ShieldModel> shieldData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/monopoly_deep/shield.json');

      if (response.statusCode == 200) {
        return shieldModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<EventsModel> eventsData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/monopoly_deep/event.json');

      if (response.statusCode == 200) {
        return eventsModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<TokensModel> tokensData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/monopoly_deep/token.json');

      if (response.statusCode == 200) {
        return tokensModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<FaqsModel> faqsData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/monopoly_deep/faq.json');

      if (response.statusCode == 200) {
        return faqsModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
