import 'package:get/get.dart';
import '../../../Api/api_calling.dart';
import '../../../Model/shield_model.dart';

class ShieldController extends GetxController {
  var ShieldData = ShieldModel(shieldData: []).obs;
  RxBool isLoading = true.obs;
  String VarelaRound = 'VarelaRound';

  @override
  void onInit() {
    fetchShieldData();
    super.onInit();
  }

  Future<void> fetchShieldData() async {
    try {
      isLoading(true);
      final shielddata = await ApiCall().shieldData();

      ShieldData.value = shielddata;
      // print(shielddata.shieldData);
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}

class ShieldsController extends GetxController {
  RxList<ShieldDatum> item = <ShieldDatum>[].obs;
  RxString rewardKey = ''.obs;
  RxInt index = 0.obs;
  String VarelaRound = 'VarelaRound';

  @override
  void onInit() {
    var ShieldDatumsData = Get.arguments['item'];
    if (ShieldDatumsData is ShieldDatum) {
      item.value = [ShieldDatumsData];
      // print(item[0].name);
    }
    // print(ShieldDatumsData);
    index.value = Get.arguments['index'];
    // print(index.value);
    super.onInit();
  }

  String get image => item[0].image;
  String get name => item[0].name;
  String get description => item[0].description;
}
