import 'package:flutter/material.dart';
import 'package:mr_white/generated/l10n.dart';
import 'package:mr_white/utils/navigator/route_list.dart';

class DummyPage extends StatelessWidget {
  const DummyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RouteList.demoLazyLoad,
                );
              },

              /// TODO set Arb
              /// TODO clean up Arb
              child: Text(S.current.demolazyload))
        ],
      ),
    );
  }
}
