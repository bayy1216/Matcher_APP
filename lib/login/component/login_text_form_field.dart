import 'package:flutter/material.dart';

import '../../common/const/color.dart';
import '../../common/const/data.dart';
import '../../common/const/text_style.dart';

class LoginTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;
  final String? initialValue;
  final TextEditingController? controller;
  final double? height;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final String? Function(String?)? validator;
  final String? labelText;
  final TextInputAction? textInputAction;
  final Function(void)? onFieldSubmitted;
  final bool isObscure;

  const LoginTextFormField({
    super.key,
    this.onChanged,
    this.autoFocus = false,
    this.labelText,
    this.hintText,
    this.errorText,
    this.initialValue,
    this.controller,
    this.height,
    this.keyboardType,
    this.textAlign,
    this.validator,
    this.textInputAction,
    this.onFieldSubmitted,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    const baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: DIVIDIER_GREY,
        width: 1,
      ),
      borderRadius: BorderRadius.all(Radius.circular(DEFAULT_BORDER_RADIUS)),
    );
    return TextFormField(
      validator: validator,
      textAlign: textAlign ?? TextAlign.start,
      controller: controller,
      initialValue: initialValue,
      cursorColor: Colors.black,
      autofocus: autoFocus,
      onChanged: onChanged,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: isObscure,
      style: CONTENT_MEDIUMN2_STYLE,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        hintText: hintText,
        errorText: errorText,
        hintStyle: const TextStyle(color: TEXT_GREY, fontSize: 14.0),
        fillColor: Colors.white,
        filled: true,
        border: baseBorder,
        // 모든 Input 상태의 기본 스타일 세팅
        enabledBorder: baseBorder,
        focusedBorder: baseBorder,
        errorBorder: baseBorder,
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 14.0, // 에러 텍스트 크기
          height: 1.0, // 에러 텍스트와 주변 컨테이너 간의 간격 조절
        ),
      ),
    );
  }
}
