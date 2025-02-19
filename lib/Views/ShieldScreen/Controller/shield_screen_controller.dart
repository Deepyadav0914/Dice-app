import 'package:get/get.dart';
import '../../../Api/api_calling.dart';
import '../../../Model/shield_model.dart';

class ShieldController extends GetxController {
  var ShieldData = ShieldModel(shieldData: []).obs;
  RxBool isLoading = true.obs;
  String Acme = 'acme';

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
      print(shielddata.shieldData);
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}
