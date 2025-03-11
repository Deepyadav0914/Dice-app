import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Api/api_calling.dart';
import '../../../Model/dice_model.dart';

class DDrewardController extends GetxController {
  RxString date = ''.obs;
  var rewardData = DiceModel(diceCode: []).obs;
  RxBool isLoading = true.obs;
  RxInt index = 0.obs;
  String VarelaRound = 'VarelaRound';
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

class DDRewardDetailController extends GetxController {
  RxList<DiceCode> reward = <DiceCode>[].obs;
  RxString date = ''.obs;
  RxString rewardKey = ''.obs;
  RxInt index = 0.obs;
  String VarelaRound = 'VarelaRound';

  @override
  void onInit() {
    var rewardData = Get.arguments['data'];
    if (rewardData is DiceCode) {
      reward.value = [rewardData];
      // print(reward[0].name);
    }
    // print(rewardData);
    date.value = Get.arguments['date'];
    // print(date.value);
    index.value = Get.arguments['index'];
    // print(index.value);
    super.onInit();
  }

  String get description => reward[0].description;
  String get name => reward[0].name;
  String get formattedDate => _formatDate(date.value);

  String _formatDate(String inputDate) {
    DateTime input = DateFormat('MMMM, dd').parse(inputDate);
    return DateFormat('EEEE, MMM dd').format(input);
  }
}
