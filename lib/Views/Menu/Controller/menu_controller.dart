import 'package:get/get.dart';
import '../../../main.dart';

class MainmenuControlller extends GetxController {
  RxInt totalDices = 0.obs;

  @override
  void onInit() {
    initializeDices();
    super.onInit();
    print("Total dices: ${totalDices.value}");
  }

  // Method to initialize dices from local storage
  void initializeDices() {
    totalDices.value =
        box.read<int>('totalDices') ?? 0; // Load coins or default to 0
  }

  // Method to collect reward dices
  void collectDices(int rewardDice) {
    totalDices.value += rewardDice;
    saveDices(); // Save updated coins to local storage
    print("Total dices: ${totalDices.value}");
  }

  void lessDices(int rewardDice) {
    totalDices.value -= rewardDice;
    saveDices(); // Save updated coins to local storage
    print("Total dices: ${totalDices.value}");
  }

  // Save totalDices to local storage
  void saveDices() {
    box.write('totalDices', totalDices.value);
    print("Total ===============: ${totalDices.value}");
  }
}
