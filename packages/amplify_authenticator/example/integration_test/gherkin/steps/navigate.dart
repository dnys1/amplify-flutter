import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_authenticator/src/blocs/auth/auth_bloc.dart';
import 'package:amplify_authenticator/src/state/inherited_auth_bloc.dart';
import 'package:gherkin/gherkin.dart';

import '../../finders/widgets_finder.dart';
import '../world/authenticator_world.dart';

final thenINavigateToScreen = then1<AuthScreen, AuthenticatorWorld>(
  'I navigate to the {screen} screen',
  (AuthScreen screen, StepContext<AuthenticatorWorld> context) async {
    final inheritedBloc = context.world.rawAppDriver
        .widget(inheritedAuthBlocFinder) as InheritedAuthBloc;
    final bloc = inheritedBloc.authBloc;

    bloc.add(AuthChangeScreen(screen));

    await context.world.rawAppDriver.pump();
  },
);
