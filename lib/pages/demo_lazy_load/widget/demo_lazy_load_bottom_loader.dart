import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_white/generated/l10n.dart';
import 'package:mr_white/pages/demo_lazy_load/bloc/demo_lazy_load_bloc.dart';

class DemoLazyLoadBottomLoader extends StatelessWidget {
  const DemoLazyLoadBottomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isError = context.select((DemoLazyLoadBloc bloc) =>
        bloc.state.status == DemoLazyLoadStatus.failure);
    if (isError) {
      return TextButton(
        onPressed: () {
          context.read<DemoLazyLoadBloc>().add(DemoLazyLoadFetched());
        },
        child: Text(S.current.tryAgain),
      );
    }
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}
