import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/component/search_text_form_field.dart';
import '../../common/const/color.dart';
import '../../common/const/data.dart';
import '../../common/layout/default_layout.dart';
import '../component/message_detail_item.dart';
import '../model/message_model.dart';
import '../repository/message_repository.dart';

final messageDetailProvider =
    FutureProvider.autoDispose.family<List<MessageModel>, int>((ref, id) async {
  final repository = ref.watch(messageRepositoryProvider);
  return await repository.getMessageById(id: id);
});

class MessageDetailScreen extends ConsumerWidget {
  static String get routeName => 'message_detail';
  final int id;

  const MessageDetailScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = TextEditingController();
    final focusNode = FocusNode();
    final state = ref.watch(messageDetailProvider(id));
    final List<MessageModel> messageList = state.when(
      data: (data) => data,
      error: (error, stackTrace) => [],
      loading: () => [],
    );
    return DefaultLayout(
      title: '메시지 목록',
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: messageList.length,
              itemBuilder: (context, index) {
                return MessageDetailItem.fromModel(model: messageList[index]);
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: DIVIDIER_GREY,
                  thickness: 0.5,
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: DEFAULT_WIDGET_PADDING, vertical: 8.0),
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: SearchTextFormField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    hintText: '메시지를 입력하세요',
                    onSubmitted: (message) {
                      _sendMessage(textEditingController);
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _sendMessage(textEditingController);
                    focusNode.unfocus();
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _sendMessage(TextEditingController controller) async{
    log('message: ${controller.text}');
    controller.text = '';
    //TODO: SEND MESSAGE
  }
}
