import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../common/const/data.dart';
import '../../common/secure_storage/secure_storage.dart';
import '../model/login_response.dart';
import '../model/user_model.dart';

final userProvider = StateNotifierProvider<UserStateNotifier, UserModelBase?>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return UserStateNotifier(
    storage: storage,
  );
});

class UserStateNotifier extends StateNotifier<UserModelBase?> {
  final FlutterSecureStorage storage;
  UserStateNotifier({
    required this.storage,
  }) : super(null){
    getMe();
  }
  Future<void> getMe() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    if (refreshToken == null || accessToken == null) {
      state = null;
      return;
    }
    state = UserModel();
  }

  void emailLogin({
    required String email,
    required String password,
  }){
    try{
      state = UserModel();
      final resp = LoginResponse(accessToken: 'accessToken', refreshToken: 'refreshToken');
      _saveTokenKey(response: resp);
    }catch(e){
      state = UserModelError(message: '로그인에 실패했습니다.');
    }
  }


  void _saveTokenKey({required LoginResponse response}) async {
    await Future.wait(
        [
          storage.write(key: REFRESH_TOKEN_KEY, value: response.refreshToken),
          storage.write(key: ACCESS_TOKEN_KEY, value: response.accessToken),
        ]
    );
  }

  void logout() async{
    state = null;

    await Future.wait(
      [
        storage.delete(key: REFRESH_TOKEN_KEY),
        storage.delete(key: ACCESS_TOKEN_KEY),
      ]
    );
  }
}