// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobDetailModel _$JobDetailModelFromJson(Map<String, dynamic> json) =>
    JobDetailModel(
      id: json['id'] as int,
      userId: json['userId'] as int,
      userName: json['userName'] as String,
      userMajor: json['userMajor'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      date: DateTime.parse(json['date'] as String),
      imageUrl:
          (json['imageUrl'] as List<dynamic>).map((e) => e as String).toList(),
      userStudentNumber: json['userStudentNumber'] as int,
      thumbnailUrl: json['thumbnailUrl'] as String,
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JobDetailModelToJson(JobDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userMajor': instance.userMajor,
      'userStudentNumber': instance.userStudentNumber,
      'title': instance.title,
      'date': instance.date.toIso8601String(),
      'thumbnailUrl': instance.thumbnailUrl,
      'userId': instance.userId,
      'userName': instance.userName,
      'content': instance.content,
      'imageUrl': instance.imageUrl,
      'comments': instance.comments,
    };
