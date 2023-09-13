import 'package:flutter/material.dart';
import 'package:mr_white/generated/l10n.dart';

class DummyPage extends StatelessWidget {
  const DummyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.dummyPage),
      ),
    );
  }
}
