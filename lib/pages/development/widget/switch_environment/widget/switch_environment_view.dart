import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:mr_white/generated/l10n.dart';
import 'package:mr_white/pages/development/widget/switch_environment/bloc/switch_environment_cubit.dart';
import 'package:mr_white/utils/environment.dart';

class SwitchEnvironmentView extends StatelessWidget {
  const SwitchEnvironmentView({super.key});

  @override
  Widget build(BuildContext context) {
    var environment =
        context.select((SwitchEnvironmentCubit bloc) => bloc.state.environment);

    Future<void> askedToLead() async {
      await showDialog<Environment>(
          context: context,
          barrierDismissible: true,
          builder: (_) {
            return SimpleDialog(
              title: Text(S.current.selectEnvironment),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () {
                    context
                        .read<SwitchEnvironmentCubit>()
                        .setEnvironment(Environment.development.name);
                    FlutterExitApp.exitApp(iosForceExit: true);
                  },
                  child: Text(Environment.development.name),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    context
                        .read<SwitchEnvironmentCubit>()
                        .setEnvironment(Environment.beta.name);
                    FlutterExitApp.exitApp(iosForceExit: true);
                  },
                  child: Text(Environment.beta.name),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    context
                        .read<SwitchEnvironmentCubit>()
                        .setEnvironment(Environment.production.name);
                    FlutterExitApp.exitApp(iosForceExit: true);
                  },
                  child: Text(Environment.production.name),
                ),
              ],
            );
          });
    }

    return TextButton(
      onPressed: askedToLead,
      child: Text(S.current.environmentEnvironment(environment)),
    );
  }
}
