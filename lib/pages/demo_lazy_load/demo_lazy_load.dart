import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_white/pages/demo_lazy_load/bloc/demo_lazy_load_bloc.dart';
import 'package:mr_white/pages/demo_lazy_load/repository/demo_lazy_load_repository.dart';
import 'package:mr_white/pages/demo_lazy_load/widget/demo_lazy_load_list.dart';

class DemoLazyLoad extends StatelessWidget {
  const DemoLazyLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => DemoLazyLoadBloc(repository: DemoLazyLoadRepository())
          ..add(DemoLazyLoadFetched()),
        child: Builder(builder: (context) {
          var isInitial = context.select((DemoLazyLoadBloc bloc) =>
              bloc.state.status == DemoLazyLoadStatus.initial);
          if (isInitial) {
            return const Center(
              child: SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(strokeWidth: 1.5),
              ),
            );
          }
          return const DemoLazyLoadList();
        }),
      ),
    );
  }
}
