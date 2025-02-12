import 'package:get/get.dart';
import '../../../Api/api_calling.dart';
import '../../../Model/stickers_model.dart';

class StickersController extends GetxController {
  late Rx<Future<StickersModel>> StickersData;

  RxInt index = 0.obs;
  String Acme = 'acme';

  @override
  void onInit() {
    super.onInit();
    fetchStickersData();
  }

  // Fetch GIFs data
  void fetchStickersData() {
    StickersData = ApiCall().stickersData().obs;
  }

  // // Method to initialize coins from local storage
  // void initializeCoins() {
  //   totalCoins.value =
  //       box.read<int>('totalCoins') ?? 0; // Load coins or default to 0
  // }

  // // Method to collect reward coins
  // void collectCoins(int coins) {
  //   totalCoins.value += coins;
  //   saveCoins(); // Save updated coins to local storage
  //   print("Total coins: ${totalCoins.value}");
  // }

  // // Method to unloacked Gifs
  // void unlockedGifs(int coins) {
  //   totalCoins.value -= coins;
  //   saveCoins(); // Save updated coins to local storage
  //   print("Total coins: ${totalCoins.value}");
  // }

  // // Save totalCoins to local storage
  // void saveCoins() {
  //   box.write('totalCoins', totalCoins.value);
  // }

  // Retry logic
  void retry() {
    fetchStickersData();
  }
}
