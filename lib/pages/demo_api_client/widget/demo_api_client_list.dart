import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_white/pages/demo_api_client/bloc/demo_api_client_bloc.dart';
import 'package:mr_white/pages/demo_api_client/widget/demo_api_client_bottom_loader.dart';
import 'package:mr_white/pages/demo_api_client/widget/demo_api_client_item.dart';

class DemoApiClientList extends StatefulWidget {
  const DemoApiClientList({Key? key}) : super(key: key);

  @override
  State<DemoApiClientList> createState() => _DemoApiClientListState();
}

class _DemoApiClientListState extends State<DemoApiClientList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      var status = context.read<DemoApiClientBloc>().state.status;
      var isError = status == DemoApiClientStatus.failure;
      if (isError) return;
      context.read<DemoApiClientBloc>().add(DemoApiClientFetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    var userDataList =
        context.select((DemoApiClientBloc bloc) => bloc.state.userDataList);
    var hasReachedMax =
        context.select((DemoApiClientBloc bloc) => bloc.state.hasReachedMax);
    var itemCount =
        hasReachedMax ? userDataList.length : userDataList.length + 1;

    return ListView.builder(
      controller: _scrollController,
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        if (index >= userDataList.length) {
          return const DemoApiClientBottomLoader();
        }

        final userData = userDataList[index];
        return DemoApiClientItem(userData: userData);
      },
    );
  }
}
