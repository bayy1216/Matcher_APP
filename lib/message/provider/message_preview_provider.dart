import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/message_preview_model.dart';
import '../repository/message_repository.dart';

final messagePreviewProvider = StateNotifierProvider<MessagePreviewStateNotifier, List<MessagePreviewModel>>((ref) {
  final repo = ref.watch(messageRepositoryProvider);
  return MessagePreviewStateNotifier(repository: repo);
});

class MessagePreviewStateNotifier extends StateNotifier<List<MessagePreviewModel>>{
  final MessageRepository repository;
  MessagePreviewStateNotifier({
    required this.repository,
}) : super([]){
    getMessagePreviewList();
  }

  Future<void> getMessagePreviewList() async{
    final resp = await repository.getMessagePreviewList();
    state = resp;
  }
}