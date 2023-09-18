import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_white/pages/demo_lazy_load/repository/demo_lazy_load_repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'demo_lazy_load_event.dart';

part 'demo_lazy_load_state.dart';

const throttleDuration = Duration(milliseconds: 100);

/// TODO set as util
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class DemoLazyLoadBloc extends Bloc<DemoLazyLoadEvent, DemoLazyLoadState> {
  DemoLazyLoadBloc({required this.repository})
      : super(const DemoLazyLoadState()) {
    on<DemoLazyLoadFetched>(
      _onDemoLazyLoadFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final DemoLazyLoadRepository repository;
  var _dummyPage = 0;

  Future<void> _onDemoLazyLoadFetched(
    DemoLazyLoadFetched event,
    Emitter<DemoLazyLoadState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      final dummyList = await repository.getDummyList(dummyPage: _dummyPage);
      if (dummyList.isEmpty) {
        return emit(state.copyWith(hasReachedMax: true));
      }
      emit(state.copyWith(
        status: DemoLazyLoadStatus.success,
        dummyList: List.of(state.dummyList)..addAll(dummyList),
        hasReachedMax: false,
      ));
      _dummyPage++;
    } catch (_) {
      emit(state.copyWith(status: DemoLazyLoadStatus.failure));
    }
  }
}
