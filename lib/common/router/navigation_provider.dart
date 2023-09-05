import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../login/view/login_screen.dart';
import '../../login/view/signup_screen.dart';
import '../view/root_tab.dart';
import '../view/splash_screen.dart';

final navigationProvider = ChangeNotifierProvider<NavigationNotifier>(
    (ref) => NavigationNotifier(ref: ref),
);

class NavigationNotifier extends ChangeNotifier {
  final Ref ref;

  NavigationNotifier({required this.ref}) {
    // ref.listen(userProvider, (previous, next) {
    //   if (previous != next) {
    //     notifyListeners();
    //   }
    // });
  }

  List<GoRoute> get routes => [
        GoRoute(
          path: '/',
          name: RootTab.routeName,
          builder: (context, state) => const RootTab(),
          routes: [

          ],
        ),
        GoRoute(
          path: '/splash',
          name: SplashScreen.routeName,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/login',
          name: LoginScreen.routeName,
          builder: (context, state) => const LoginScreen(),
          routes: [
            GoRoute(
              path: 'signup',
              name: SignupScreen.routeName,
              builder: (context, state) => const SignupScreen(),
            ),
          ],
        ),


      ];

  String? redirectLogic(BuildContext context, GoRouterState state) {
    return null;
  }
}
