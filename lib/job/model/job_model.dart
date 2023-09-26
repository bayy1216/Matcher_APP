import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_model.g.dart';
@JsonSerializable()
class JobModel{
  final int id;
  final String userMajor;
  final int userStudentNumber;
  final String title;
  final DateTime date;
  final String thumbnailUrl;
  JobModel({
    required this.id,
    required this.userMajor,
    required this.userStudentNumber,
    required this.title,
    required this.date,
    required this.thumbnailUrl,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) => _$JobModelFromJson(json);
  Map<String, dynamic> toJson() => _$JobModelToJson(this);

}