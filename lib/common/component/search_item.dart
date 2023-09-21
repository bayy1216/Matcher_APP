
import 'package:flutter/material.dart';

import '../const/color.dart';

class SearchItem extends StatelessWidget {
  final String keyword;
  final void Function() onTap;
  const SearchItem({
    super.key,
    required this.keyword,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(keyword, overflow: TextOverflow.ellipsis)),
            GestureDetector(
              onTap: onTap,
              child: Icon(Icons.close),
            ),
          ],
        ),
        const Divider(
          color: DIVIDIER_GREY,
          thickness: 0.25,
        ),
      ],
    );
  }
}

