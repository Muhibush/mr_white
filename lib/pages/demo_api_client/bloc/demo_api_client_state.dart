part of 'demo_api_client_bloc.dart';

enum DemoApiClientStatus {
  initial,
  success,
  failure,
}

class DemoApiClientState extends Equatable {
  const DemoApiClientState({
    this.status = DemoApiClientStatus.initial,
    this.userDataList = const <UserData>[],
    this.hasReachedMax = false,
  });

  final DemoApiClientStatus status;
  final List<UserData> userDataList;
  final bool hasReachedMax;

  DemoApiClientState copyWith({
    DemoApiClientStatus? status,
    List<UserData>? userDataList,
    bool? hasReachedMax,
  }) {
    return DemoApiClientState(
      status: status ?? this.status,
      userDataList: userDataList ?? this.userDataList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''
    DemoApiClientState {
      status: $status,
      dummyList: ${userDataList.length},
      hasReachedMax: $hasReachedMax
    }
    ''';
  }

  @override
  List<Object> get props => [status, userDataList, hasReachedMax];
}
