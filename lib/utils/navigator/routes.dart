import 'package:flutter/material.dart';
import 'package:mr_white/pages/blank/blank_page.dart';
import 'package:mr_white/pages/demo_lazy_load/demo_lazy_load.dart';
import 'package:mr_white/pages/development/development.dart';
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
      case RouteList.development:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const Development());
      case RouteList.demoLazyLoad:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DemoLazyLoad());
      default:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const BlankPage());
    }
  }
}
