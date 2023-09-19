import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_white/pages/demo_lazy_load/bloc/demo_lazy_load_bloc.dart';
import 'package:mr_white/pages/demo_lazy_load/widget/demo_lazy_load_bottom_loader.dart';
import 'package:mr_white/pages/demo_lazy_load/widget/demo_lazy_load_item.dart';

class DemoLazyLoadList extends StatefulWidget {
  const DemoLazyLoadList({Key? key}) : super(key: key);

  @override
  State<DemoLazyLoadList> createState() => _DemoLazyLoadListState();
}

class _DemoLazyLoadListState extends State<DemoLazyLoadList> {
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
      var status = context.read<DemoLazyLoadBloc>().state.status;
      var isError = status == DemoLazyLoadStatus.failure;
      if (isError) return;
      context.read<DemoLazyLoadBloc>().add(DemoLazyLoadFetched());
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
    var dummyList =
        context.select((DemoLazyLoadBloc bloc) => bloc.state.dummyList);
    var hasReachedMax =
        context.select((DemoLazyLoadBloc bloc) => bloc.state.hasReachedMax);
    var itemCount = hasReachedMax ? dummyList.length : dummyList.length + 1;

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return index >= dummyList.length
            ? const DemoLazyLoadBottomLoader()
            : GestureDetector(
                onTap: () {
                  context.read<DemoLazyLoadBloc>().add(DemoLazyLoadFetched());
                },
                child: DemoLazyLoadItem(index: index));
      },
      itemCount: itemCount,
      controller: _scrollController,
    );
  }
}
