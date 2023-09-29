import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_white/generated/l10n.dart';
import 'package:mr_white/pages/demo_api_client/bloc/demo_api_client_bloc.dart';
import 'package:mr_white/pages/demo_api_client/widget/demo_api_client_list.dart';
import 'package:mr_white/pages/demo_api_client/widget/demo_api_client_loading_indicator.dart';

class DemoApiClientView extends StatelessWidget {
  const DemoApiClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.demoApiClientPage)),
      body: Builder(builder: (context) {
        var isInitial = context.select((DemoApiClientBloc bloc) =>
            bloc.state.status == DemoApiClientStatus.initial);
        if (isInitial) {
          return const DemoApiClientLoadingIndicator();
        }
        return const DemoApiClientList();
      }),
    );
  }
}
