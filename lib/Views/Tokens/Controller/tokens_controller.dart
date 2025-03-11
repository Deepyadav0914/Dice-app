import 'package:dice_app/Api/api_calling.dart';
import 'package:get/get.dart';
import '../../../Model/tokens_model.dart';

class TokensController extends GetxController {
  var tokenData = TokensModel(tokensData: []).obs;
  RxBool isLoading = true.obs;
  String VarelaRound = 'VarelaRound';

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

class TokensDetailController extends GetxController {
  RxList<TokensDatum> item = <TokensDatum>[].obs;

  RxInt index = 0.obs;
  String VarelaRound = 'VarelaRound';

  @override
  void onInit() {
    var TokensDatumsData = Get.arguments['item'];
    if (TokensDatumsData is TokensDatum) {
      item.value = [TokensDatumsData];
      // print(item[0].name);
    }
    // print(TokensDatumsData);
    index.value = Get.arguments['index'];
    // print(index.value);
    super.onInit();
  }

  String get image => item[0].image;
  String get name => item[0].name;
  String get description => item[0].description;
}
