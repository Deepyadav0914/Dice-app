import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../AdsWidget/Google/Banner/GoogleBanner.dart';
import '../../MainJson/MainJson.dart';

class GlobalBannerRN extends HookWidget {
  final BuildContext parentContext;

  const GlobalBannerRN({required this.parentContext, super.key});

  @override
  Widget build(BuildContext context) {
    MainJson mainJson = context.read<MainJson>();
    final bannerWidget = useState<Widget>(const SizedBox(
      height: 0,
      width: 0,
    ));

    showAd() {
      if (mainJson.data == null || mainJson.data == {}) {
        bannerWidget.value = const SizedBox(
          height: 0,
          width: 0,
        );
        return;
      }
      if ((mainJson.data![mainJson.version]['globalConfig']['globalAdFlag'] ??
              false) ==
          false) {
        bannerWidget.value = const SizedBox(
          height: 0,
          width: 0,
        );
        return;
      }
      if ((mainJson.data![mainJson.version]['globalConfig']['globalBanner'] ??
              false) ==
          false) {
        bannerWidget.value = const SizedBox(
          height: 0,
          width: 0,
        );
        return;
      }

      bannerWidget.value = const GoogleBanner();
    }

    useEffect(() {
      showAd();
      return () {};
    }, []);
    return bannerWidget.value;
  }
}
