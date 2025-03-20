import 'package:flutter/material.dart';
import '../Views/Events/eventimages_details.dart';
import '../Views/Events/events_screen.dart';
import '../Views/Events/specialevent_details.dart';
import '../Views/Events/tournament_details.dart';
import '../Views/Faqs/faqs_Screen.dart';
import '../Views/Game/game_screen.dart';
import '../Views/Menu/menu_screen.dart';
import '../Views/Origins/origins_details_screen.dart';
import '../Views/Origins/origins_screen.dart';
import '../Views/Rewards/ddreward_details_screen.dart';
import '../Views/Rewards/ddreward_screen.dart';
import '../Views/Settings/settings_screen.dart';
import '../Views/Shield/shield_details_screen.dart';
import '../Views/Shield/shield_screen.dart';
import '../Views/Splash/splash_screen.dart';
import '../Views/Stickers/stickers_details_screen.dart';
import '../Views/Stickers/stickers_screen.dart';
import '../Views/Tokens/tokens_details_screen.dart';
import '../Views/Tokens/tokens_screen.dart';

class Router {
  static MaterialPageRoute onRouteGenerator(settings) {
    switch (settings.name) {
      case MenuScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MenuScreen(),
        );

      case SplashScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => SplashScreen(),
        );

      case DDrewardScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => DDrewardScreen(),
        );

      case DDRewardDetailScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => DDRewardDetailScreen(),
        );

      case StickersScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => StickersScreen(),
        );

      case StickerDetailsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => StickerDetailsScreen(),
        );

      case OriginsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => OriginsScreen(),
        );

      case OriginsDetailScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => OriginsDetailScreen(),
        );

      case ShieldScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ShieldScreen(),
        );

      case ShieldsDetailScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ShieldsDetailScreen(),
        );

      case EventsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => EventsScreen(),
        );

      case TournamentScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => TournamentScreen(),
        );

      case EventImagesScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => EventImagesScreen(),
        );

      case SpecialEventScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => SpecialEventScreen(),
        );

      case TokensScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => TokensScreen(),
        );

      case TokensDetailScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => TokensDetailScreen(),
        );

      case FaqsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => FaqsScreen(),
        );

      case GameScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => GameScreen(),
        );

      case SettingScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => SettingScreen(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Material(
            child: Center(
              child: Text("404 page not founded"),
            ),
          ),
        );
    }
  }
}
