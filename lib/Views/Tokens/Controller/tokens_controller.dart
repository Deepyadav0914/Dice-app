import 'package:dice_app/Api/api_calling.dart';
import 'package:get/get.dart';
import '../../../Model/tokens_model.dart';

class TokensController extends GetxController {
  var tokenData = TokensModel(tokensData: []).obs;
  RxBool isLoading = true.obs;
  String VarelaRound = 'VarelaRound';
  String ReemKufi='ReemKufi';

  @override
  void onInit() {
    fetchTokensData();
    super.onInit();
  }

  Future<void> fetchTokensData() async {
    try {
      isLoading(true);
      final data = await ApiCall().tokensData();

      tokenData.value = data;
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}
