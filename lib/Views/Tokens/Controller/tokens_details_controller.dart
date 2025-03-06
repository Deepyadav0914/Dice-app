import 'package:get/get.dart';
import '../../../Model/tokens_model.dart';

class TokensDetailController extends GetxController {
  RxList<TokensDatum> item = <TokensDatum>[].obs;

  RxInt index = 0.obs;
  String VarelaRound = 'VarelaRound';


  @override
  void onInit() {
    var TokensDatumsData = Get.arguments['item'];
    if (TokensDatumsData is TokensDatum) {
      item.value = [TokensDatumsData];
      print(item[0].name);
    }
    print(TokensDatumsData);
    index.value = Get.arguments['index'];
    print(index.value);
    super.onInit();
  }

  String get image => item[0].image;
  String get name => item[0].name;
  String get description => item[0].description;
}
