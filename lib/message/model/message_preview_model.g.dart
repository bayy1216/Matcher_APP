// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_preview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagePreviewModel _$MessagePreviewModelFromJson(Map<String, dynamic> json) =>
    MessagePreviewModel(
      id: json['id'] as int,
      chatUser: json['chatUser'] as String,
      preview: json['preview'] as String,
      latestMessageTime: DateTime.parse(json['latestMessageTime'] as String),
    );

Map<String, dynamic> _$MessagePreviewModelToJson(
        MessagePreviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chatUser': instance.chatUser,
      'preview': instance.preview,
      'latestMessageTime': instance.latestMessageTime.toIso8601String(),
    };
