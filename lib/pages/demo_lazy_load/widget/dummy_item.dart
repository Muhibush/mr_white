import 'package:flutter/material.dart';

class DummyItem extends StatelessWidget {
  const DummyItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(index.toString()),
    );
  }
}
