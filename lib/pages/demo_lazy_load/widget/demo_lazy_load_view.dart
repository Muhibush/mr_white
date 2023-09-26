import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_white/pages/demo_lazy_load/bloc/demo_lazy_load_bloc.dart';
import 'package:mr_white/pages/demo_lazy_load/widget/demo_lazy_load_list.dart';
import 'package:mr_white/pages/demo_lazy_load/widget/demo_lazy_load_loading_indicator.dart';

class DemoLazyLoadView extends StatelessWidget {
  const DemoLazyLoadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        var isInitial = context.select((DemoLazyLoadBloc bloc) =>
            bloc.state.status == DemoLazyLoadStatus.initial);
        if (isInitial) {
          return const DemoLazyLoadLoadingIndicator();
        }
        return const DemoLazyLoadList();
      }),
    );
  }
}
