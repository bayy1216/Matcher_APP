import 'package:flutter/material.dart';

import '../../common/const/data.dart';
import '../../common/const/text_style.dart';
import '../../common/utils/data_utils.dart';
import '../model/message_preview_model.dart';

class MessagePreviewItem extends StatelessWidget {
  final String chatUser;
  final String preview;
  final DateTime latestMessageTime;
  const MessagePreviewItem({
    super.key,
    required this.chatUser,
    required this.preview,
    required this.latestMessageTime,
  });
  factory MessagePreviewItem.fromModel({
    required MessagePreviewModel model,
  }) {
    return MessagePreviewItem(
      chatUser: model.chatUser,
      preview: model.preview,
      latestMessageTime: model.latestMessageTime,
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
              Text(chatUser, style: TITLE_SAMLL_STYLE.copyWith(fontWeight: FontWeight.w600),),
              Text(DataUtils.dateToString(latestMessageTime)
                , style: CONTENT_SMALL_STYLE,),
            ],
          ),
          Text(preview, style: CONTENT_MEDIUMN2_STYLE),
        ],
      ),
    );
  }
}
