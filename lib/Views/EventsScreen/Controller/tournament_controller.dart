import 'package:get/get.dart';
import '../../../Model/events_Model.dart';

class TournamentController extends GetxController {
  RxList<EventDatum> event = <EventDatum>[].obs;
  RxInt index = 0.obs;
  String Acme = 'acme';
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    var tournamentsData = Get.arguments['event'];
    if (tournamentsData is EventDatum) {
      event.value = [tournamentsData];
      print(event[0].tournaments[0].description);
    }
    print(tournamentsData);
    index.value = Get.arguments['index'];
    print(index.value);
    super.onInit();
  }

  String get time => event[0].tournaments[0].tData[0].time;
  String get name => event[0].tournaments[0].tData[0].name;
  String get description => event[0].tournaments[0].description;
}
