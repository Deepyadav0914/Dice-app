import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Model/dice_model.dart';

class DDRewardDetailController extends GetxController {
  RxList<DiceCode> reward = <DiceCode>[].obs;
  RxString date = ''.obs;
  RxString rewardKey = ''.obs;
  RxInt index = 0.obs;
  String Acme = 'acme';
  int rewardCoins = 150;

  @override
  void onInit() {
    var rewardData = Get.arguments['data'];
    if (rewardData is DiceCode) {
      reward.value = [rewardData];
      print(reward[0].name);
    }
    print(rewardData);
    date.value = Get.arguments['date'];
    print(date.value);
    index.value = Get.arguments['index'];
    print(index.value);
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
