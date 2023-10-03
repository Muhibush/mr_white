part of 'switch_environment_cubit.dart';

class SwitchEnvironmentState extends Equatable {
  const SwitchEnvironmentState({this.environment = ''});

  final String environment;

  SwitchEnvironmentState copyWith({
    String? environment,
  }) => SwitchEnvironmentState(environment: environment ?? this.environment);

  @override
  String toString() => '''
    SwitchEnvironmentState {
      environment: $environment
    }
    ''';

  @override
  List<Object?> get props => [environment];
}
