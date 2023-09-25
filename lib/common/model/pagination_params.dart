import 'package:json_annotation/json_annotation.dart';


part 'pagination_params.g.dart';


@JsonSerializable()
class PaginationParams {
  final int page;

  const PaginationParams({
    required this.page,
  });

  PaginationParams copyWith({
    int? page,
  }) {
    return PaginationParams(
      page: page ?? this.page,
    );
  }

  factory PaginationParams.fromJson(Map<String, dynamic> json) =>
      _$PaginationParamsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationParamsToJson(this);
}