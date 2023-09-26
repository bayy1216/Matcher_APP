// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobModel _$JobModelFromJson(Map<String, dynamic> json) => JobModel(
      id: json['id'] as int,
      userMajor: json['userMajor'] as String,
      userStudentNumber: json['userStudentNumber'] as int,
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      thumbnailUrl: json['thumbnailUrl'] as String,
    );

Map<String, dynamic> _$JobModelToJson(JobModel instance) => <String, dynamic>{
      'id': instance.id,
      'userMajor': instance.userMajor,
      'userStudentNumber': instance.userStudentNumber,
      'title': instance.title,
      'date': instance.date.toIso8601String(),
      'thumbnailUrl': instance.thumbnailUrl,
    };
