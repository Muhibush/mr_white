part of 'demo_lazy_load_bloc.dart';

enum DemoLazyLoadStatus {
  initial,
  loading,
  success,
  failure,
}

class DemoLazyLoadState extends Equatable {
  const DemoLazyLoadState({
    this.status = DemoLazyLoadStatus.initial,
    this.dummyList = const <int>[],
    this.hasReachedMax = false,
  });

  final DemoLazyLoadStatus status;
  final List<int> dummyList;
  final bool hasReachedMax;

  DemoLazyLoadState copyWith({
    DemoLazyLoadStatus? status,
    List<int>? dummyList,
    bool? hasReachedMax,
  }) {
    return DemoLazyLoadState(
      status: status ?? this.status,
      dummyList: dummyList ?? this.dummyList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''
    DemoLazyLoadState {
      status: $status,
      dummyList: ${dummyList.length},
      hasReachedMax: $hasReachedMax
    }
    ''';
  }

  @override
  List<Object> get props => [status, dummyList, hasReachedMax];
}
