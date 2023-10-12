import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/const/data.dart';
import '../../common/const/text_style.dart';
import '../../common/layout/default_layout.dart';
import '../../reservation/view/reservation_screen.dart';
import '../component/login_text_form_field.dart';
import '../provider/user_provider.dart';

class NativeLoginScreen extends ConsumerWidget {
  static String get routeName => 'native_login';

  const NativeLoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return DefaultLayout(
      title: '',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DEFAULT_PADDING_H),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('이메일 로그인', style: TITLE_LARGE1_STYLE),
              const SizedBox(height: 30),
              LoginTextFormField(
                hintText: '이메일을 입력해주세요',
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '이메일을 입력해주세요';
                  } else if (!RegExp(
                    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
                  ).hasMatch(value)) {
                    return '올바른 이메일 형식을 입력해주세요.';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 10),
              LoginTextFormField(
                hintText: '비밀번호를 입력해주세요',
                controller: passwordController,
                textInputAction: TextInputAction.done,
                isObscure: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '비밀번호를 입력해주세요';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  if (formKey.currentState!.validate()) {
                    ref.read(userProvider.notifier).emailLogin(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  }
                },
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    ref.read(userProvider.notifier).emailLogin(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  }
                },
                child: Text(
                  '로그인',
                  style: CONTENT_MEDIUMN2_STYLE.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



}
