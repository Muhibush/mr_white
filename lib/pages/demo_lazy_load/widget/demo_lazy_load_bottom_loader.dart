import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_white/generated/l10n.dart';
import 'package:mr_white/pages/demo_lazy_load/bloc/demo_lazy_load_bloc.dart';

class DemoLazyLoadBottomLoader extends StatelessWidget {
  const DemoLazyLoadBottomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isError = context.select((DemoLazyLoadBloc bloc) =>
        bloc.state.status == DemoLazyLoadStatus.failure);
    if (isError) {
      return Padding(
        padding: EdgeInsets.all(8.w),
        child: TextButton(
          onPressed: () {
            context.read<DemoLazyLoadBloc>().add(DemoLazyLoadFetched());
          },
          child: Text(S.current.tryAgain),
        ),
      );
    }
    return Container(
      margin: EdgeInsets.all(16.w),
      alignment: Alignment.center,
      child: SizedBox(
        height: 24.w,
        width: 24.w,
        child: CircularProgressIndicator(strokeWidth: 1.5.w),
      ),
    );
  }
}
