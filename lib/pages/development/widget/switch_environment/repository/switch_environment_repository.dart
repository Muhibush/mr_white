import 'package:mr_white/utils/shared_preference_mr_white.dart';

class SwitchEnvironmentRepository {
  String getEnvironment() => SharedPreferenceMrWhite.getEnv();

  void setEnvironment({required String environment}) =>
      SharedPreferenceMrWhite.setEnv(environment);
}
