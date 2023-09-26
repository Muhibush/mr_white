import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DemoLazyLoadLoadingIndicator extends StatelessWidget {
  const DemoLazyLoadLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 24.w,
        width: 24.w,
        child: CircularProgressIndicator(strokeWidth: 1.5.r),
      ),
    );
  }
}
