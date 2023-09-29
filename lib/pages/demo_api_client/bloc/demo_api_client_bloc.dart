import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_white/pages/demo_api_client/model/get_users_response.dart';
import 'package:mr_white/pages/demo_api_client/repository/demo_api_client_repository.dart';
import 'package:mr_white/utils/throttle_droppable.dart';

part 'demo_api_client_event.dart';

part 'demo_api_client_state.dart';

const throttleDuration = Duration(milliseconds: 100);

class DemoApiClientBloc extends Bloc<DemoApiClientEvent, DemoApiClientState> {
  DemoApiClientBloc({required this.repository})
      : super(const DemoApiClientState()) {
    on<DemoApiClientFetched>(
      _onDemoApiClientFetched,
      transformer: ThrottleDroppable.throttleDroppable(throttleDuration),
    );
  }

  final DemoApiClientRepository repository;
  var _currentPage = 1;

  Future<void> _onDemoApiClientFetched(
    DemoApiClientFetched event,
    Emitter<DemoApiClientState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      final getUsersResponse = await repository.getUsers(page: _currentPage);
      var userDataList = getUsersResponse.userData ?? [];
      var page = getUsersResponse.page;
      var totalPages = getUsersResponse.totalPages;
      var hasReachedMax = page == totalPages;
      _currentPage++;

      emit(state.copyWith(
        status: DemoApiClientStatus.success,
        userDataList: List.of(state.userDataList)..addAll(userDataList),
        hasReachedMax: hasReachedMax,
      ));
    } catch (_) {
      emit(state.copyWith(
        status: DemoApiClientStatus.failure,
      ));
    }
  }
}
