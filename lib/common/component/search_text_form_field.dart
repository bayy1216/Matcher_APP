
import 'package:flutter/material.dart';

import '../const/color.dart';

class SearchTextFormField extends StatelessWidget {
  final String hintText;
  final Function(String)? onSubmitted;
  const SearchTextFormField({
    super.key,
    required this.hintText,
    required this.onSubmitted,
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
