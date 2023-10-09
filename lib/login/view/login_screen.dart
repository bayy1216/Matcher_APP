import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../common/const/data.dart';
import '../../common/layout/default_layout.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static String get routeName => 'login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          const SizedBox(
            height: 100,
            width: 100,
            child: Placeholder(),
          ),
          const SizedBox(height: 250),
          GestureDetector(
            onTap: () async{
              // 카카오톡 설치 여부 확인
// 카카오톡이 설치되어 있으면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
              if (await isKakaoTalkInstalled()) {
                try {
                  await UserApi.instance.loginWithKakaoTalk();
                  User user = await UserApi.instance.me();
                  if(!context.mounted) return;
                  context.goNamed(SignupScreen.routeName,queryParameters: {
                    'id' : user.id.toString(),
                  },);
                  print('카카오톡으로 로그인 성공');
                } catch (error) {
                  print('카카오톡으로 로그인 실패 $error');

                  // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
                  // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
                  if (error is PlatformException && error.code == 'CANCELED') {
                    return;
                  }
                  // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
                  try {
                    await UserApi.instance.loginWithKakaoAccount();
                    User user = await UserApi.instance.me();
                    if(!context.mounted) return;
                    context.goNamed(SignupScreen.routeName,queryParameters: {
                      'id' : user.id.toString(),
                    },);
                    print('카카오계정으로 로그인 성공');
                  } catch (error) {
                    print('카카오계정으로 로그인 실패 $error');
                  }
                }
              } else {
                print("카카오톡이 설치되어 있지 않음");
                try {
                  await UserApi.instance.loginWithKakaoAccount();
                  User user = await UserApi.instance.me();
                  if(!context.mounted) return;
                  context.goNamed(SignupScreen.routeName,queryParameters: {
                    'id' : user.id.toString(),
                  },);
                  print('사용자 정보 요청 성공'
                      '\n회원번호: ${user.id}'
                      '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
                      '\n이메일: ${user.kakaoAccount?.email}');
                  print('카카오계정으로 로그인 성공');
                } catch (error) {
                  print('카카오계정으로 로그인 실패 $error');
                }
              }
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: DEFAULT_PADDING_H),
              height: 47,
              width: double.infinity,
              color: Colors.yellow,
              child: Text('카카오 로그인'),
            ),
          ),
        ],
      ),
    );
  }
}
