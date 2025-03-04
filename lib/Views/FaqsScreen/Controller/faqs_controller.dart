import 'package:dice_app/Api/api_calling.dart';
import 'package:get/get.dart';
import '../../../Model/faqs_model.dart';

class FaqsController extends GetxController {
  var FaqsData = FaqsModel(data: []).obs;
  RxBool isLoading = true.obs;
  String VarelaRound = 'VarelaRound';
  String ReemKufi='ReemKufi';

  @override
  void onInit() {
    fetchFaqsData();
    super.onInit();
  }

  Future<void> fetchFaqsData() async {
    try {
      isLoading(true);
      final data = await ApiCall().faqsData();

      FaqsData.value = data;
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}
