import 'package:get/get.dart';
import '../../../Api/api_calling.dart';
import '../../../Model/stickers_model.dart';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saver_gallery/saver_gallery.dart';

class StickersController extends GetxController {
  late Rx<Future<StickersModel>> StickersData;
  RxInt index = 0.obs;
  String VarelaRound = 'VarelaRound';

  @override
  void onInit() {
    super.onInit();
    fetchStickersData();
  }

  // Fetch stickers data
  void fetchStickersData() {
    StickersData = ApiCall().stickersData().obs;
  }

  // Retry logic
  void retry() {
    fetchStickersData();
  }
}

class StickerDetailsController extends GetxController {
  final RxString sticker = ''.obs;
  String VarelaRound = 'VarelaRound';

  /// Requests necessary permissions based on the platform.
  Future<bool> checkAndRequestPermissions({required bool skipIfExists}) async {
    if (!Platform.isAndroid && !Platform.isIOS) return false;

    if (Platform.isAndroid) {
      final deviceInfo = await DeviceInfoPlugin().androidInfo;
      final sdkInt = deviceInfo.version.sdkInt;

      if (skipIfExists) {
        return sdkInt >= 33
            ? await Permission.photos.request().isGranted
            : await Permission.storage.request().isGranted;
      } else {
        return sdkInt >= 29
            ? true
            : await Permission.storage.request().isGranted;
      }
    } else if (Platform.isIOS) {
      return skipIfExists
          ? await Permission.photos.request().isGranted
          : await Permission.photosAddOnly.request().isGranted;
    }

    return false;
  }

  /// Downloads a GIF from the network and saves it to the gallery.
  Future<void> saveSticker() async {
    try {
      final response = await Dio().get(
        sticker.value,
        options: Options(responseType: ResponseType.bytes),
      );
      String imagePath = "downloaded_image.jpg";
      final result = await SaverGallery.saveImage(
        Uint8List.fromList(response.data),
        quality: 100,
        fileName: imagePath,
        androidRelativePath: "Pictures/DiceApp/Sticker",
        skipIfExists: false,
      );
      Get.snackbar(
        "Success",
        "Sticker downloaded successfully!",
        snackPosition: SnackPosition.TOP,
        icon: Icon(Icons.done_outline, color: Colors.black87),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.grey[500],
        colorText: Colors.black87,
      );
    } catch (e) {
      Get.snackbar(
        "Failure",
        "Sticker download failed!",
        snackPosition: SnackPosition.TOP,
        icon: Icon(Icons.cancel_outlined, color: Colors.black87),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.grey[500],
        colorText: Colors.black87,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    sticker.value = Get.arguments['Stickers'];
    log(sticker.value);
    checkAndRequestPermissions(skipIfExists: false);
  }

  String get stricker => sticker.value;
}
