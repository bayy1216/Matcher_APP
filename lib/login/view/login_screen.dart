import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/layout/default_layout.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static String get routeName => 'login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              context.goNamed(SignupScreen.routeName);
            },
            child: Text('회원가입'),
          ),
        ],
      ),
    );
  }
}
