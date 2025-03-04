import 'package:get/get.dart';
import '../../../Model/events_Model.dart';

class SpecialEventController extends GetxController {
  RxList<EventDatum> event = <EventDatum>[].obs;
  RxInt index = 0.obs;
  String VarelaRound = 'VarelaRound';
  String ReemKufi='ReemKufi';
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    var SpecialEventsData = Get.arguments['event'];
    if (SpecialEventsData is EventDatum) {
      event.value = [SpecialEventsData];
      print(event[0].specialEvents[0].description);
    }
    print(SpecialEventsData);
    index.value = Get.arguments['index'] ?? 0;
    print(index.value);

    super.onInit();
  }

  String get images => event[0].specialEvents[0].seData[0].image;
  String get name => event[0].specialEvents[0].seData[0].name;
  String get duration => event[0].specialEvents[0].seData[0].duration;
  String get startTime => event[0].specialEvents[0].seData[0].startTime;
  String get endDate => event[0].specialEvents[0].seData[0].endDate;
  String get description => event[0].specialEvents[0].description;
}
