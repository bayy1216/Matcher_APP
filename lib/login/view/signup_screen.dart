import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/const/data.dart';
import '../../common/const/text_style.dart';
import '../../common/layout/default_layout.dart';
import '../../reservation/view/reservation_screen.dart';
import '../component/login_text_form_field.dart';

class SignupScreen extends ConsumerStatefulWidget {
  static String get routeName => 'signup';
  final bool isNativeSignup;

  const SignupScreen({
    super.key,
    required this.isNativeSignup,
  });

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  bool isInfoAgree = false;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return DefaultLayout(
      title: '',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DEFAULT_PADDING_H),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Text('회원정보를\n입력해 주세요', style: TITLE_LARGE1_STYLE),
              const SizedBox(height: 30),
              if (widget.isNativeSignup)
                _NativeSignupInput(),
              Text('학번', style: CONTENT_SMALL_STYLE.copyWith(color: Colors.black),),
              const SizedBox(height: 4),
              LoginTextFormField(
                hintText: '학번 2자리를 입력해주세요',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '학번을 입력해주세요';
                  }
                  else if(value.length != 2){
                    return '학번 2자리를 입력해주세요';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 10),
              Text('학과', style: CONTENT_SMALL_STYLE.copyWith(color: Colors.black),),
              const SizedBox(height: 4),
              LoginTextFormField(
                hintText: '학과를 입력해주세요',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '학과를 입력해주세요';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 10),
              Text('닉네임', style: CONTENT_SMALL_STYLE.copyWith(color: Colors.black),),
              const SizedBox(height: 4),
              LoginTextFormField(
                hintText: '닉네임을 입력해주세요',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '닉네임을 입력해주세요';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: isInfoAgree,
                    onChanged: (value) {
                      setState(() {
                        isInfoAgree = value!;
                      });
                    },
                  ),
                  Text('개인정보 처리방침에 동의합니다.',style: CONTENT_SMALL_STYLE.copyWith(color: Colors.black),),
                ],
              ),
              TextButton(
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    if(!isInfoAgree){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('개인정보 처리방침에 동의해주세요.'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                      return;
                    }
                    context.goNamed(ReservationScreen.routeName);//로그인 함수로 나중에 변경
                  }
                },
                child: Text('회원가입', style: CONTENT_MEDIUMN2_STYLE.copyWith(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class _NativeSignupInput extends StatelessWidget {
  const _NativeSignupInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('이메일', style: CONTENT_SMALL_STYLE.copyWith(color: Colors.black),),
        const SizedBox(height: 4),
        LoginTextFormField(
          hintText: '이메일을 입력해주세요',
          keyboardType: TextInputType.emailAddress,
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
        Text('비밀번호', style: CONTENT_SMALL_STYLE.copyWith(color: Colors.black),),
        const SizedBox(height: 4),
        LoginTextFormField(
          hintText: '비밀번호를 입력해주세요',
          isObscure: true,
          textInputAction: TextInputAction.done,
          validator: (value) {
            if (value!.isEmpty) {
              return '비밀번호를 입력해주세요';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
