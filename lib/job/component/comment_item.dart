import 'package:flutter/material.dart';

import '../../common/utils/data_utils.dart';
import '../model/comment_model.dart';

class CommentItem extends StatelessWidget {
  final String content;
  final DateTime date;
  final String userName;
  final Function() onDelete;

  const CommentItem({
    super.key,
    required this.content,
    required this.date,
    required this.userName,
    required this.onDelete,
  });

  factory CommentItem.fromModel({
    required CommentModel model,
    required Function() onDelete,
  }) {
    return CommentItem(
      content: model.content,
      date: model.date,
      userName: model.userName,
      onDelete: onDelete,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(userName),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(content),
            ),
            IconButton(
              onPressed: onDelete,
              icon: Icon(Icons.delete),
            ),
          ],
        ),
        Text(DataUtils.dateToString(date))
      ],
    );
  }
}
