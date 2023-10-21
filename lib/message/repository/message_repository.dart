import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/dio/dio_client.dart';
import '../model/message_model.dart';
import '../model/message_preview_model.dart';

final messageRepositoryProvider = Provider<MessageRepository>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return MessageRepository(
    dioClient: dioClient,
  );
});

class MessageRepository{
  final DioClient _dioClient;
  MessageRepository({required DioClient dioClient}) : _dioClient = dioClient;

  Future<List<MessagePreviewModel>> getMessagePreviewList() async{
    return [
      MessagePreviewModel(id: 1, chatUser: '홍길동', preview: '안녕하세요', latestMessageTime: DateTime(2021, 10, 1)),
      MessagePreviewModel(id: 2, chatUser: '홍길동', preview: '안녕하세요', latestMessageTime: DateTime(2021,6, 1)),
      MessagePreviewModel(id: 3, chatUser: '홍길동', preview: '안녕하세요', latestMessageTime: DateTime(2021, 10, 1)),
    ];
  }

  Future<List<MessageModel>> getMessageById({required int id})async{
    return [
      MessageModel(id: 1, content: 'content', createdAt: DateTime(2021,10,5,12,11)),
      MessageModel(id: 2, content: 'content', createdAt: DateTime(2021,10,5,12,11)),
      MessageModel(id: 3, content: 'content', createdAt: DateTime(2021,10,5,12,11)),
    ];
  }
}