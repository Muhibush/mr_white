import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_white/pages/demo_lazy_load/bloc/demo_lazy_load_bloc.dart';
import 'package:mr_white/pages/demo_lazy_load/repository/demo_lazy_load_repository.dart';
import 'package:mr_white/pages/demo_lazy_load/widget/bottom_loader.dart';
import 'package:mr_white/pages/demo_lazy_load/widget/dummy_item.dart';

class DemoLazyLoad extends StatefulWidget {
  const DemoLazyLoad({Key? key}) : super(key: key);

  @override
  State<DemoLazyLoad> createState() => _DemoLazyLoadState();
}

class _DemoLazyLoadState extends State<DemoLazyLoad> {
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
    if (_isBottom) context.read<DemoLazyLoadBloc>().add(DemoLazyLoadFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => DemoLazyLoadBloc(repository: DemoLazyLoadRepository())
          ..add(DemoLazyLoadFetched()),

        /// TODO builder vs BlocBuilder is builder with many select will rebuild more many time?
        child: Builder(builder: (context) {
          var status =
              context.select((DemoLazyLoadBloc bloc) => bloc.state.status);
          if (status == DemoLazyLoadStatus.initial) {
            return const Center(
              child: SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(strokeWidth: 1.5),
              ),
            );
          }
          return Builder(builder: (context) {
            /// TODO
            /// is it rebuild when status changed to failure or loading?
            /// expected: do not rebuild
            ///
            /// is rebuild 2x when dummyList and hasReachedMax changed at the same time

            var dummyList =
                context.select((DemoLazyLoadBloc bloc) => bloc.state.dummyList);
            var hasReachedMax = context
                .select((DemoLazyLoadBloc bloc) => bloc.state.hasReachedMax);
            var itemCount =
                hasReachedMax ? dummyList.length : dummyList.length + 1;

            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= dummyList.length
                    ? const BottomLoader()
                    : DummyItem(index: index);
              },
              itemCount: itemCount,
              controller: _scrollController,
            );
          });
        }),
      ),
    );
  }
}
