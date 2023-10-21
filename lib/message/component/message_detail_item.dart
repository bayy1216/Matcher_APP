import 'package:flutter/material.dart';

import '../../common/const/data.dart';
import '../../common/const/text_style.dart';
import '../../common/utils/data_utils.dart';
import '../model/message_model.dart';

class MessageDetailItem extends StatelessWidget {
  final String content;
  final DateTime createdAt;

  const MessageDetailItem({
    super.key,
    required this.content,
    required this.createdAt,
  });

  factory MessageDetailItem.fromModel({
    required MessageModel model,
  }) {
    return MessageDetailItem(
      content: model.content,
      createdAt: model.createdAt,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DEFAULT_WIDGET_PADDING),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('chatUser', style: TITLE_SAMLL_STYLE.copyWith(fontWeight: FontWeight.w600),),
              Text(DataUtils.dateToString(createdAt)
                , style: CONTENT_SMALL_STYLE,),
            ],
          ),
          Text(content, style: CONTENT_MEDIUMN2_STYLE),
        ],
      ),
    );
  }
}
