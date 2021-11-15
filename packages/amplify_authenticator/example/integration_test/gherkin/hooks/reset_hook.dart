import 'package:gherkin/gherkin.dart';

import '../world/authenticator_world.dart';

class ResetHook extends Hook {
  @override
  int get priority => 100;

  @override
  Future<void> onAfterScenarioWorldCreated(
    World world,
    String scenario,
    Iterable<Tag> tags,
  ) async {
    return (world as AuthenticatorWorld).reset();
  }
}
