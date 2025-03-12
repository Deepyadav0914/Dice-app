import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController {
  String url = "https://clashhero.in/privacy.php";

  //  launch URL
  void launchURL(BuildContext context, String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      print(url);
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch $url'),
        ),
      );
    }
  }
}
