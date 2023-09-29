import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_white/pages/demo_api_client/bloc/demo_api_client_bloc.dart';
import 'package:mr_white/pages/demo_api_client/widget/demo_api_client_item.dart';

class DemoApiClientList extends StatelessWidget {
  const DemoApiClientList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userDataList =
        context.select((DemoApiClientBloc bloc) => bloc.state.userDataList);

    return ListView.builder(
      itemCount: userDataList.length,
      itemBuilder: (BuildContext context, int index) {
        final userData = userDataList[index];
        return DemoApiClientItem(userData: userData);
      },
    );
  }
}
