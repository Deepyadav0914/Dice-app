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

class OriginsDetailController extends GetxController {
  RxList<Origin> item = <Origin>[].obs;
  RxInt index = 0.obs;
  RxBool isLoading = true.obs;
  String VarelaRound = 'VarelaRound';

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if (arguments is Map<String, dynamic>) {
      if (arguments.containsKey('item') && arguments['item'] is Origin) {
        item.value = [arguments['item']];
      }
      if (arguments.containsKey('index')) {
        index.value = arguments['index'];
      }
    }
    isLoading.value = false;
  }

  String get image => item[0].stickers[0].image;
  String get name => item[0].stickers[0].name;
}
