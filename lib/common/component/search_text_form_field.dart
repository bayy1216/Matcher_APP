
import 'package:flutter/material.dart';

import '../const/color.dart';

class SearchTextFormField extends StatelessWidget {
  final String hintText;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  const SearchTextFormField({
    super.key,
    required this.hintText,
    required this.onSubmitted,
    this.controller,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TEXT_FORM_FIELD_BG,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextField(
          focusNode: focusNode,
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(10),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14,
              color: TEXT_GREY,
            ),
            border: InputBorder.none,
          ),
          onSubmitted: onSubmitted,
        ),
      ),
    );
  }
}
