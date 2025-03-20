import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import '../../../Api/api_calling.dart';
import '../../../Model/dice_model.dart';
import '../../../main.dart';
import '../../Menu/Controller/menu_controller.dart';

class DDrewardController extends GetxController {
  RxString date = ''.obs;
  var rewardData = DiceModel(diceCode: []).obs;
  RxBool isLoading = true.obs;
  RxInt index = 0.obs;
  String VarelaRound = 'VarelaRound';

  RxMap<String, bool> claimedRewards = <String, bool>{}.obs;

  @override
  void onInit() {
    fetchRewardData();
    loadClaimedRewards();

    super.onInit();
  }

  Future<void> fetchRewardData() async {
    try {
      isLoading(true);
      final data = await ApiCall().diceData();
      rewardData.value = data;
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }

  String formatDate(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('MMMM, dd').format(date); // Example output: "March 2"
  }

  void loadClaimedRewards() {
    claimedRewards.value = box
            .read<Map<String, dynamic>>('claimedRewards')
            ?.map((key, value) => MapEntry(key, value as bool)) ??
        {};
  }

  void claimReward(String uniqueKey) {
    claimedRewards[uniqueKey] = true;
    box.write('claimedRewards', claimedRewards);
  }
}

class DDRewardDetailController extends GetxController {
  RxList<DiceCode> reward = <DiceCode>[].obs;
  RxString date = ''.obs;
  RxString rewardKey = ''.obs;
  RxInt index = 0.obs;
  String VarelaRound = 'VarelaRound';
  final DDrewardController rewardController = Get.find();
  RxBool isClaimed = false.obs;

  @override
  void onInit() {
    var rewardData = Get.arguments['data'];
    if (rewardData is DiceCode) {
      reward.value = [rewardData];
    }
    date.value = Get.arguments['date'];
    index.value = Get.arguments['index'];
    rewardKey.value = "${reward[0].name}_${date.value}_${index.value}";
    isClaimed.value = rewardController.claimedRewards[rewardKey.value] ?? false;
    super.onInit();
  }

  String get description => reward[0].description;
  String get name => reward[0].name;
  String get formattedDate => formatDate(date.value);

  String formatDate(String inputDate) {
    DateTime input = DateFormat('MMMM, dd').parse(inputDate);
    return DateFormat('EEEE, MMM dd').format(input);
  }

  void claimReward() {
    final title = name.split(' ');

    int rewardDice = int.parse(title[0]);
    print(rewardDice.runtimeType);

    final MainmenuControlller con = Get.put(MainmenuControlller());
    con.collectDices(rewardDice);

    rewardController.claimReward(rewardKey.value);

    isClaimed.value = true;
  }

  Future<void> onShareWithResult(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    ShareResult shareResult;
    if (reward[0].url.isNotEmpty) {
      shareResult = await Share.shareUri(
        Uri.parse(reward[0].url),
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );
    } else {
      shareResult = await Share.share(
        reward[0].url,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );
    }
    scaffoldMessenger.showSnackBar(getResultSnackBar(shareResult));
  }

  SnackBar getResultSnackBar(ShareResult result) {
    return SnackBar(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Share result: ${result.status}",
            style: TextStyle(
              fontSize: 14.r,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
          if (result.status == ShareResultStatus.success)
            Text("Shared to: ${result.raw}")
        ],
      ),
      padding: EdgeInsets.all(15),
      duration: Duration(seconds: 3),
    );
  }
}
