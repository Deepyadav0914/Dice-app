import 'package:get/get.dart';
import '../../../Api/api_calling.dart';
import '../../../Model/stickers_model.dart';

class StickersController extends GetxController {
  late Rx<Future<StickersModel>> StickersData;

  RxInt index = 0.obs;
  String Acme = 'acme';

  @override
  void onInit() {
    super.onInit();
    fetchStickersData();
  }

  // Fetch stickers data
  void fetchStickersData() {
    StickersData = ApiCall().stickersData().obs;
  }

  // Retry logic
  void retry() {
    fetchStickersData();
  }
}
