import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_white/pages/demo_api_client/bloc/demo_api_client_bloc.dart';
import 'package:mr_white/pages/demo_api_client/repository/demo_api_client_repository.dart';
import 'package:mr_white/pages/demo_api_client/widget/demo_api_client_view.dart';

class DemoApiClientPage extends StatelessWidget {
  const DemoApiClientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DemoApiClientBloc(repository: DemoApiClientRepository())
        ..add(DemoApiClientFetched()),
      child: const DemoApiClientView(),
    );
  }
}
