import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_white/pages/development/widget/switch_environment/repository/switch_environment_repository.dart';

part 'switch_environment_state.dart';

class SwitchEnvironmentCubit extends Cubit<SwitchEnvironmentState> {
  SwitchEnvironmentCubit({required this.repository})
      : super(const SwitchEnvironmentState());

  final SwitchEnvironmentRepository repository;

  void getEnvironment() {
    var environment = repository.getEnvironment();
    emit(state.copyWith(environment: environment));
  }

  void setEnvironment(String environment) {
    repository.setEnvironment(environment: environment);
    getEnvironment();
  }
}
