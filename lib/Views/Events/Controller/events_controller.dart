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
