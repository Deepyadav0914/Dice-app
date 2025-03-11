import 'package:get/get.dart';
import '../../../Api/api_calling.dart';
import '../../../Model/events_Model.dart';

class EventsController extends GetxController {
  var eventsData = EventsModel(eventData: []).obs;
  RxBool isLoading = false.obs;
  String VarelaRound = 'VarelaRound';

  @override
  void onInit() {
    super.onInit();
    fetchEventsData();
  }

  Future<void> fetchEventsData() async {
    try {
      isLoading(true);
      final fetchedData = await ApiCall().eventsData();

      if (fetchedData.eventData.isNotEmpty) {
        eventsData.value = fetchedData;

        // print(eventsData.value);
      } else {
        Get.snackbar("No Events", "No event data available.");
      }
    } catch (e) {
      Get.snackbar(
          "Error", "Failed to load events. Please check your connection.");
    } finally {
      isLoading(false);
    }
  }
}

class TournamentController extends GetxController {
  RxList<EventDatum> event = <EventDatum>[].obs;
  RxInt index = 0.obs;
  String VarelaRound = 'VarelaRound';
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    var tournamentsData = Get.arguments['event'];
    if (tournamentsData is EventDatum) {
      event.value = [tournamentsData];
      // print(event[0].tournaments[0].description);
    }
    // print(tournamentsData);
    index.value = Get.arguments['index'];
    // print(index.value);
    super.onInit();
  }

  String get time => event[0].tournaments[0].tData[0].time;
  String get name => event[0].tournaments[0].tData[0].name;
  String get description => event[0].tournaments[0].description;
}

class EventImageController extends GetxController {
  RxList<EventDatum> event = <EventDatum>[].obs;
  RxInt index = 0.obs;
  String VarelaRound = 'VarelaRound';
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    var imagesData = Get.arguments['event'];
    if (imagesData is EventDatum) {
      event.value = [imagesData];
      // print(event[0].eventImages);
    }
    // print(imagesData);
    index.value = Get.arguments['index'];
    // print(index.value);
    super.onInit();
  }

  String get eventImages => event[0].eventImages[0];
}

class SpecialEventController extends GetxController {
  RxList<EventDatum> event = <EventDatum>[].obs;
  RxInt index = 0.obs;
  String VarelaRound = 'VarelaRound';
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    var SpecialEventsData = Get.arguments['event'];
    if (SpecialEventsData is EventDatum) {
      event.value = [SpecialEventsData];
      // print(event[0].specialEvents[0].description);
    }
    // print(SpecialEventsData);
    index.value = Get.arguments['index'] ?? 0;
    // print(index.value);

    super.onInit();
  }

  String get images => event[0].specialEvents[0].seData[0].image;
  String get name => event[0].specialEvents[0].seData[0].name;
  String get duration => event[0].specialEvents[0].seData[0].duration;
  String get startTime => event[0].specialEvents[0].seData[0].startTime;
  String get endDate => event[0].specialEvents[0].seData[0].endDate;
  String get description => event[0].specialEvents[0].description;
}
