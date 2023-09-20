import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../alarm/view/alarm_screen.dart';
import '../../job/view/job_detail_screen.dart';
import '../../job/view/job_screen.dart';
import '../../login/view/login_screen.dart';
import '../../login/view/signup_screen.dart';
import '../../my/view/my_screen.dart';
import '../../reservation/view/resvervation_screen.dart';
import '../view/root_tab.dart';
import '../view/splash_screen.dart';
import 'go_router.dart';

final _shellReservationKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellReservation');
final _shellJobKey = GlobalKey<NavigatorState>(debugLabel: 'shellJob');
final _shellAlarmKey = GlobalKey<NavigatorState>(debugLabel: 'shellAlarm');
final _shellMyKey = GlobalKey<NavigatorState>(debugLabel: 'shellMy');

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

  List<RouteBase> get routes => [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return RootTab(
              navigationShell: navigationShell,
            );
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _shellReservationKey,
              routes: [
                GoRoute(
                  path: '/reservation',
                  name: ReservationScreen.routeName,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: ReservationScreen(),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellJobKey,
              routes: [
                GoRoute(
                  path: '/job',
                  name: JobScreen.routeName,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: JobScreen(),
                  ),
                  routes: [
                    GoRoute(
                      path: 'job_detail',
                      name: JobDetailScreen.routeName,
                      parentNavigatorKey: rootNavigatorKey,
                      pageBuilder: (context, state){
                        return const NoTransitionPage(
                          child: JobDetailScreen(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellAlarmKey,
              routes: [
                GoRoute(
                  path: '/alarm',
                  name: AlarmScreen.routeName,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: AlarmScreen(),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellMyKey,
              routes: [
                GoRoute(
                  path: '/my',
                  name: MyScreen.routeName,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: MyScreen(),
                  ),
                ),
              ],
            ),
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
