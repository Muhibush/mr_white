import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_white/pages/development/widget/switch_environment/bloc/switch_environment_cubit.dart';
import 'package:mr_white/pages/development/widget/switch_environment/repository/switch_environment_repository.dart';
import 'package:mr_white/pages/development/widget/switch_environment/widget/switch_environment_view.dart';

class SwitchEnvironmentWidget extends StatelessWidget {
  const SwitchEnvironmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SwitchEnvironmentCubit(repository: SwitchEnvironmentRepository())
            ..getEnvironment(),
      child: const SwitchEnvironmentView(),
    );
  }
}
