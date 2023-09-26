import 'package:flutter/material.dart';
import 'package:mr_white/generated/l10n.dart';
import 'package:mr_white/utils/navigator/route_list.dart';

class DevelopmentPage extends StatelessWidget {
  const DevelopmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RouteList.demoLazyLoadPage,
                );
              },
              child: Text(S.current.demolazyload))
        ],
      ),
    );
  }
}
