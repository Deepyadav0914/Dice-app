import 'package:get/get.dart';
import '../../../Model/shield_model.dart';

class ShieldsController extends GetxController {
  RxList<ShieldDatum> item = <ShieldDatum>[].obs;
  RxString rewardKey = ''.obs;
  RxInt index = 0.obs;
  String VarelaRound = 'VarelaRound';
  String ReemKufi='ReemKufi';

  @override
  void onInit() {
    var ShieldDatumsData = Get.arguments['item'];
    if (ShieldDatumsData is ShieldDatum) {
      item.value = [ShieldDatumsData];
      print(item[0].name);
    }
    print(ShieldDatumsData);
    index.value = Get.arguments['index'];
    print(index.value);
    super.onInit();
  }

  String get image => item[0].image;
  String get name => item[0].name;
  String get description => item[0].description;
}
