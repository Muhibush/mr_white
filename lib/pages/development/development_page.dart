import 'package:flutter/material.dart';
import 'package:mr_white/generated/l10n.dart';
import 'package:mr_white/utils/navigator/route_list.dart';

class DevelopmentPage extends StatelessWidget {
  const DevelopmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.developmentPage)),
      body: ListView(
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RouteList.demoLazyLoadPage,
                );
              },
              child: Text(S.current.demoLazyLoadPage)),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RouteList.demoApiClientPage,
                );
              },
              child: Text(S.current.demoApiClientPage)),
        ],
      ),
    );
  }
}
