
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel{
  final int id;
  final String content;
  final DateTime date;
  final int userId;
  final String userName;

  CommentModel({
    required this.id,
    required this.content,
    required this.date,
    required this.userId,
    required this.userName,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}