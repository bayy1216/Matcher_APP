import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'navigation_provider.dart';

final routerProvider = Provider<GoRouter>((ref){
  final provider = ref.read(navigationProvider);
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/login',
    routes: provider.routes,
    refreshListenable: provider,
    redirect: provider.redirectLogic,
  );
});