part of 'demo_lazy_load_bloc.dart';

sealed class DemoLazyLoadEvent extends Equatable {
  const DemoLazyLoadEvent();

  @override
  List<Object?> get props => [];
}

final class DemoLazyLoadFetched extends DemoLazyLoadEvent {}
