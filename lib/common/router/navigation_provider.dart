import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../alarm/view/alarm_screen.dart';
import '../../job/view/job_detail_screen.dart';
import '../../job/view/job_screen.dart';
import '../../job/view/job_serach_screen.dart';
import '../../login/model/user_model.dart';
import '../../login/provider/user_provider.dart';
import '../../login/view/login_screen.dart';
import '../../login/view/native_login_screen.dart';
import '../../login/view/signup_screen.dart';
import '../../my/view/my_screen.dart';
import '../../reservation/view/reservation_detail_screen.dart';
import '../../reservation/view/reservation_screen.dart';
import '../../reservation/view/reservation_search_screen.dart';
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
    ref.listen(userProvider, (previous, next) {
      if (previous != next) {
        notifyListeners();
      }
    });
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
                  routes: [
                    GoRoute(
                      path: 'reservation_detail',
                      name: ReservationDetailScreen.routeName,
                      parentNavigatorKey: rootNavigatorKey,
                      pageBuilder: (context, state){
                        return const NoTransitionPage(
                          child: ReservationDetailScreen(),
                        );
                      },
                    ),
                    GoRoute(
                      path: 'reservation_search',
                      name: ReservationSearchScreen.routeName,
                      parentNavigatorKey: rootNavigatorKey,
                      pageBuilder: (context, state){
                        return const NoTransitionPage(
                          child: ReservationSearchScreen(),
                        );
                      },
                    ),
                  ],
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
                      path: 'job_detail/:id',
                      name: JobDetailScreen.routeName,
                      parentNavigatorKey: rootNavigatorKey,
                      pageBuilder: (context, state){
                        return NoTransitionPage(
                          child: JobDetailScreen(id: int.parse(state.pathParameters['id']!)),
                        );
                      },
                    ),
                    GoRoute(
                      path: 'job_search',
                      name: JobSearchScreen.routeName,
                      parentNavigatorKey: rootNavigatorKey,
                      pageBuilder: (context, state){
                        return const NoTransitionPage(
                          child: JobSearchScreen(),
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
              builder: (context, state){
                final isNativeSignup = state.uri.queryParameters['native_signup'] == '1';
                return SignupScreen(
                  isNativeSignup: isNativeSignup,
                );
              },
            ),
            GoRoute(
              path: 'native_login',
              name: NativeLoginScreen.routeName,
              builder: (context, state){
                return const NativeLoginScreen();
              },
            ),
          ],
        ),
      ];

  //로그인 상태에 따라 리다이렉트
  //유저 상태 변경시 notifyListeners에 의해 발동
  String? redirectLogic(BuildContext context, GoRouterState state) {
    final user = ref.read(userProvider);

    final isTryLogin = state.fullPath == '/login' || state.fullPath == '/login/signup' || state.fullPath == '/login/native_login';
    switch(user){
      //유저정보 없을시,
      //로그인중이면 그대로, 아니면 로그인 화면으로 가게한다.
      case null:
        return isTryLogin ? null : '/login';

      //유저정보 있을시
      //로그인 중이거나, 현재위치가 첫화면일경우 홈으로 가게한다
      case UserModel():
        return isTryLogin || state.fullPath == '/login' ? '/reservation' : null;

      //오류 발생시 로그인 화면으로
      case UserModelError():
        return isTryLogin ? null : '/login';

    }
  }
}
