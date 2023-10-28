// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      id: json['id'] as int,
      content: json['content'] as String,
      date: DateTime.parse(json['date'] as String),
      userId: json['userId'] as int,
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'date': instance.date.toIso8601String(),
      'userId': instance.userId,
      'userName': instance.userName,
    };
