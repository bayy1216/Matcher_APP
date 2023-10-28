import 'package:freezed_annotation/freezed_annotation.dart';

import 'comment_model.dart';
import 'job_model.dart';

part 'job_detail_model.g.dart';

@JsonSerializable()
class JobDetailModel extends JobModel{
  final int userId;
  final String userName;
  final String content;
  final List<String> imageUrl;
  final List<CommentModel> comments;

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
    required this.comments,
  });

  factory JobDetailModel.fromJson(Map<String, dynamic> json) => _$JobDetailModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$JobDetailModelToJson(this);

  JobDetailModel copyWith({
    int? id,
    int? userId,
    String? userName,
    String? userMajor,
    String? title,
    String? content,
    DateTime? date,
    List<String>? imageUrl,
    int? userStudentNumber,
    String? thumbnailUrl,
    List<CommentModel>? comments,
  }) => JobDetailModel(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    userName: userName ?? this.userName,
    userMajor: userMajor ?? this.userMajor,
    title: title ?? this.title,
    content: content ?? this.content,
    date: date ?? this.date,
    imageUrl: imageUrl ?? this.imageUrl,
    userStudentNumber: userStudentNumber ?? this.userStudentNumber,
    thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    comments: comments ?? this.comments,
  );
}