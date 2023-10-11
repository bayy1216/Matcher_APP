import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/const/data.dart';
import '../../common/layout/default_layout.dart';
import '../../reservation/view/reservation_screen.dart';

class SignupScreen extends StatelessWidget {
  static String get routeName => 'signup';
  final bool isNativeSignup;

  const SignupScreen({
    super.key,
    required this.isNativeSignup,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DEFAULT_PADDING_H),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('회원정보를\n입력해 주세요'),
            TextButton(
              onPressed: () async{
                try {
                  //OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
                  //print('카카오톡으로 로그인 성공 ${token.accessToken}');
                } catch (error) {
                  print('카카오톡으로 로그인 실패 $error');
                }
                context.goNamed(ReservationScreen.routeName);//로그인 함수로 나중에 변경
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text('회원가입'),
            ),
            SignUpTextFormField(),
          ],
        ),
      ),
    );
  }
}


class SignUpTextFormField extends StatelessWidget {
  const SignUpTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(

    );
  }
}
