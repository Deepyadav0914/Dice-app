import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Api/api_calling.dart';
import '../../../Model/dice_model.dart';

class DDrewardController extends GetxController {
  RxString date = ''.obs;
  var rewardData = DiceModel(diceCode: []).obs;
  RxBool isLoading = true.obs;
  String Acme = 'acme';
  RxBool isClaimed = false.obs;

  @override
  void onInit() {
    fetchRewardData();
    super.onInit();
  }

  Future<void> fetchRewardData() async {
    try {
      isLoading(true);
      final data = await ApiCall().diceData();

      rewardData.value = data;
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }

  String formatDate(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('MMMM, dd').format(date); // Example output: "March 2"
  }
}
