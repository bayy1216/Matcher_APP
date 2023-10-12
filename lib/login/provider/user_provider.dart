import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';

final userProvider = StateNotifierProvider<UserStateNotifier, UserModelBase?>((ref) {
  return UserStateNotifier();
});

class UserStateNotifier extends StateNotifier<UserModelBase?> {
  UserStateNotifier() : super(null){
    login();
  }

  void login() {
    state = UserModel();
  }

  void logout() {
    state = null;
  }
}