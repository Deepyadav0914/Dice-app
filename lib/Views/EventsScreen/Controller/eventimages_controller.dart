import 'package:get/get.dart';
import '../../../Model/events_Model.dart';

class EventImageController extends GetxController {
  RxList<EventDatum> event = <EventDatum>[].obs;
  RxInt index = 0.obs;
  String Acme = 'acme';
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    var imagesData = Get.arguments['event'];
    if (imagesData is EventDatum) {
      event.value = [imagesData];
      print(event[0].eventImages);
    }
    print(imagesData);
    index.value = Get.arguments['index'];
    print(index.value);
    super.onInit();
  }


  String get eventImages => event[0].eventImages[0];
}
