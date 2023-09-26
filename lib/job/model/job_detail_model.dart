import 'package:freezed_annotation/freezed_annotation.dart';

import 'job_model.dart';

part 'job_detail_model.g.dart';

@JsonSerializable()
class JobDetailModel extends JobModel{
  final int userId;
  final String userName;
  final String content;
  final List<String> imageUrl;

  JobDetailModel({
    required super.id,
    required this.userId,
    required this.userName,
    required super.userMajor,
    required super.title,
    required this.content,
    required super.date,
    required this.imageUrl,
    required super.userStudentNumber,
    required super.thumbnailUrl,
  });

  factory JobDetailModel.fromJson(Map<String, dynamic> json) => _$JobDetailModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$JobDetailModelToJson(this);
}