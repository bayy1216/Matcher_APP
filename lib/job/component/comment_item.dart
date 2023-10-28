import 'package:flutter/material.dart';

import '../../common/const/data.dart';
import '../../common/const/text_style.dart';
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
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: DEFAULT_WIDGET_PADDING * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 12,
                backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q='
                  'tbn:ANd9GcSK10NckXTTzmLQxJu6maCL_Z5SUTphEUjGvw&usqp=CAU',
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                  child: Text(
                userName,
                style: CONTENT_MEDIUMN_STYLE,
              )),
              IconButton(
                onPressed: onDelete,
                icon: Icon(Icons.delete),
              ),
            ],
          ),
          Text(
            content,
            style: CONTENT_MEDIUMN2_STYLE,
          ),
          Text(
            DataUtils.dateToString(date),
            style: CONTENT_SMALL_STYLE,
          )
        ],
      ),
    );
  }
}
