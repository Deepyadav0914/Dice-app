import 'package:dart_ping_ios/dart_ping_ios.dart';
import 'package:dice_app/AdPlugin/AdLoader/AdLoader.dart';
import 'package:dice_app/AdPlugin/Provider/AdpluginProvider.dart';
import 'package:dice_app/AdPlugin/Utils/Extensions.dart';
import 'package:dice_app/res/NavigationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dice_app/Routes/Routes.dart' as r;
import 'AdPlugin/Screen/SplashScreen.dart';
import 'Views/Menu/menu_screen.dart';
import 'Views/Splash/splash_screen.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

GetStorage box = GetStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DartPingIOS.register();
    return AdpluginProvider(
      child: AdLoader(
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return GetMaterialApp(
              home: AdSplashScreen(
                  onComplete: (context, mainJson) async {
                    "SplashScreen".performAction(
                      context: context,
                      onComplete: () {
                        Navigator.pushReplacementNamed(
                            context, MenuScreen.routeName);
                      },
                    );
                  },
                  servers: const [
                    "miracocopepsi.com",
                    // "coinspinmaster.com",
                    // "trailerspot4k.com",
                  ],
                  jsonUrl: const [
                    "https://miracocopepsi.com/admin/mayur/coc/pradip/ios/monopoly_deep/main.json",
                    // "https://coinspinmaster.com/",
                    // "https://trailerspot4k.com/"
                  ],
                  version: '1.0.0',
                  child: const SplashScreen()),
              navigatorKey: NavigationService.navigatorKey,
              onGenerateRoute: r.Router.onRouteGenerator,
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),
            );
          },
        ),
      ),
    );
  }
}
