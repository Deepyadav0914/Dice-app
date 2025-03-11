import 'package:dice_app/res/NavigationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dice_app/Routes/Routes.dart' as r;

import 'Views/Splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

GetStorage box = GetStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          navigatorKey: NavigationService.navigatorKey,
          onGenerateRoute: r.Router.onRouteGenerator,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          home: SplashScreen(),
        );
      },
    );
  }
}
