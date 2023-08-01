import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../view/splash_screen.dart';

final navigationProvider = ChangeNotifierProvider<NavigationNotifier>((ref) =>
    NavigationNotifier(ref: ref));

class NavigationNotifier extends ChangeNotifier {
  final Ref ref;

  NavigationNotifier({required this.ref}){
    // ref.listen(userProvider, (previous, next) {
    //   if (previous != next) {
    //     notifyListeners();
    //   }
    // });
  }

  List<GoRoute> get routes =>
      [
        GoRoute(
          path: '/splash',
          name: SplashScreen.routeName,
          builder: (context, state) => const SplashScreen(),
        ),
      ];

  String? redirectLogic(BuildContext context, GoRouterState state) {
    return null;
  }
}