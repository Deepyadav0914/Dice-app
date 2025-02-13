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
      final data = await ApiCall().shieldData();

      ShieldData.value = data;
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}
