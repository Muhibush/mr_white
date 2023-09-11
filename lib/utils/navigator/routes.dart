import 'package:flutter/material.dart';
import 'package:mr_white/pages/blank/blank_page.dart';
import 'package:mr_white/pages/dummy/dummy_page.dart';
import 'package:mr_white/pages/home/home_page.dart';
import 'package:mr_white/utils/navigator/route_list.dart';

class Routes {
  static Route getRouteGenerate(RouteSettings settings) =>
      _routeGenerate(settings);

  static Route _routeGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RouteList.home:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomePage());
      case RouteList.dummyPage:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DummyPage());
      default:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const BlankPage());
    }
  }
}
