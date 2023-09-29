import 'package:flutter/material.dart';
import 'package:mr_white/pages/blank/blank_page.dart';
import 'package:mr_white/pages/demo_api_client/demo_api_client_page.dart';
import 'package:mr_white/pages/demo_lazy_load/demo_lazy_load_page.dart';
import 'package:mr_white/pages/development/development_page.dart';
import 'package:mr_white/pages/home/home_page.dart';
import 'package:mr_white/utils/navigator/route_list.dart';

class Routes {
  static Route getRouteGenerate(RouteSettings settings) =>
      _routeGenerate(settings);

  static Route _routeGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RouteList.homePage:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomePage());
      case RouteList.developmentPage:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DevelopmentPage());
      case RouteList.demoLazyLoadPage:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DemoLazyLoadPage());
      case RouteList.demoApiClientPage:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DemoApiClientPage());
      default:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const BlankPage());
    }
  }
}
