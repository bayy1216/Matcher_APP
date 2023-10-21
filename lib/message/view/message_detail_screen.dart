import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/color.dart';
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
    final state = ref.watch(messageDetailProvider(id));
    final List<MessageModel> messageList = state.when(
      data: (data) => data,
      error: (error, stackTrace) => [],
      loading: () => [],
    );
    return DefaultLayout(
      title: '메시지 목록',
      body: ListView.separated(
        itemCount: messageList.length,
        itemBuilder: (context, index) {
          return MessageDetailItem.fromModel(model: messageList[index]);
        },
        separatorBuilder: (context, index){
          return const Divider(
            color: DIVIDIER_GREY,
            thickness: 0.5,
          );
        },
      ),
    );
  }
}
