part of 'demo_api_client_bloc.dart';

sealed class DemoApiClientEvent extends Equatable {
  const DemoApiClientEvent();

  @override
  List<Object?> get props => [];
}

final class DemoApiClientFetched extends DemoApiClientEvent {}
