import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DemoLazyLoadItem extends StatelessWidget {
  const DemoLazyLoadItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(index.toString(), textAlign: TextAlign.center),
      contentPadding: EdgeInsets.all(16.w),
    );
  }
}
