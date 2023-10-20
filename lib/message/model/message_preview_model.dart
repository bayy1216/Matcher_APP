import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_preview_model.g.dart';
@JsonSerializable()
class MessagePreviewModel{
  int id;
  String chatUser;
  String preview;
  DateTime latestMessageTime;
  MessagePreviewModel({
    required this.id,
    required this.chatUser,
    required this.preview,
    required this.latestMessageTime,
  });

  factory MessagePreviewModel.fromJson(Map<String, dynamic> json) => _$MessagePreviewModelFromJson(json);
}