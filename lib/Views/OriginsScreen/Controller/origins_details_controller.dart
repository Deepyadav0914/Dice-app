import 'package:get/get.dart';
import '../../../Model/origins_model.dart';

class OriginsDetailController extends GetxController {
  RxList<Origin> item = <Origin>[].obs;
  RxString rewardKey = ''.obs;
  RxInt index = 0.obs;
  String Acme = 'acme';

  @override
  void onInit() {
    var originsData = Get.arguments['item'];
    if (originsData is Origin) {
      item.value = [originsData];
      print(item[0].category);
    }
    print(originsData);
    index.value = Get.arguments['index'];
    print(index.value);
    super.onInit();
  }

  String get sticker => item[0].stickers[0].image;
  String get name => item[0].stickers[0].name;
  String get category => item[0].category;
}
