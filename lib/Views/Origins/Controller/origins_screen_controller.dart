import 'package:dice_app/Api/api_calling.dart';
import 'package:get/get.dart';
import '../../../Model/origins_model.dart';

class OriginsController extends GetxController {
  var originsData = OriginsModel(origins: []).obs;
  RxBool isLoading = true.obs;
  String VarelaRound = 'VarelaRound';


  @override
  void onInit() {
    fetchOriginsData();
    super.onInit();
  }

  Future<void> fetchOriginsData() async {
    try {
      isLoading(true);
      final data = await ApiCall().originsData();

      originsData.value = data;
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}
