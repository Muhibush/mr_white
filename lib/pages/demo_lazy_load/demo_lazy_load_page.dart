import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_white/pages/demo_lazy_load/bloc/demo_lazy_load_bloc.dart';
import 'package:mr_white/pages/demo_lazy_load/repository/demo_lazy_load_repository.dart';
import 'package:mr_white/pages/demo_lazy_load/widget/demo_lazy_load_view.dart';

class DemoLazyLoadPage extends StatelessWidget {
  const DemoLazyLoadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DemoLazyLoadBloc(repository: DemoLazyLoadRepository())
        ..add(DemoLazyLoadFetched()),
      child: const DemoLazyLoadView(),
    );
  }
}
