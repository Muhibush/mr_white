import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

/// TODO set bloc observer based on env or build
class MrWhiteBlocObserver extends BlocObserver {
  const MrWhiteBlocObserver();

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);

    /// TODO check log
    log(transition as String);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log(error as String);
    super.onError(bloc, error, stackTrace);
  }
}
